import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:todo_v2/core/services/api_service_client.dart';
import 'package:todo_v2/core/services/global_services.dart';
import 'package:todo_v2/core/services/message.alert.dart';
import 'package:todo_v2/navigation/bottom_navigation.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  late TextEditingController newPassword;
  late TextEditingController confirmPassword;

  final hidePassword = true.obs;
  final hideNewPassword = true.obs;
  final hideConfirmPassword = true.obs;

  RxBool isLoading = false.obs;

  late Map<String, dynamic> jsonData;

  final logger = Logger();
  final localStorage = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
  }

  Future<void> login({required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState!.validate()) {
      try {
        var data = {
          "email": email.text.trim(),
          "password": password.text.trim(),
        };

        isLoading.value = true;

        HttpResponse response = await ApiServicesClient().post(
          endpoint: loginEndPoint,
          data: data,
        );

        final userData = await json.decode(response.body);

        if (userData['status'] == "error") {
          MessageAlert.errorSnackBar(userData['message']);
        } else {
          await localStorage.write('userId', userData['data']['id']);
          await localStorage.write('email', userData['data']['email']);

          Get.offAll(() => const BottomNavigation());

          MessageAlert.showSuccessMessage("logged in successfully");
        }
      } catch (e) {
        logger.e(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> register({required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        var data = {
          "name": name.text.trim(),
          "email": email.text.trim(),
          "password": password.text.trim(),
        };

        HttpResponse response = await ApiServicesClient().post(
          endpoint: registerEndPoint,
          data: data,
        );

        final userData = await json.decode((response.body));

        if (userData['status'] == "error") {
          MessageAlert.errorSnackBar(
            userData['message'],
          );
        } else {
          await localStorage.write('userId', userData['data']['id']);
          await localStorage.write('email', userData['data']['email']);

          Get.offAll(() => const BottomNavigation());

          MessageAlert.showSuccessMessage("Logged in successfully");
        }
      } catch (e) {
        logger.e(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> changePassword({required GlobalKey<FormState> formKey}) async {
    try {
      if (formKey.currentState!.validate()) {
        final userEmail = await localStorage.read('email');

        isLoading.value = true;
        var data = {
          "email": userEmail,
          "password": password.text.trim(),
          "new_password": newPassword.text.trim(),
        };
        HttpResponse response = await ApiServicesClient().post(
          endpoint: changePasswordEndPoint,
          data: data,
        );

        final responseData = await json.decode((response.body));

        if (responseData['status'] == "error") {
          MessageAlert.errorSnackBar(
            responseData['message'],
          );
        } else {
          Get.back();

          MessageAlert.showSuccessMessage(
            responseData['message'],
          );
        }
      }
    } catch (e) {
      logger.e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  onClose() {
    super.onClose();
    name.clear();
    email.clear();
    password.clear();
    newPassword.clear();
    confirmPassword.clear();
  }
}
