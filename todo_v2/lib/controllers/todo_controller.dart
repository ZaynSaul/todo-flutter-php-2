import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:todo_v2/core/services/api_service_client.dart';
import 'package:todo_v2/core/services/global_services.dart';
import 'package:todo_v2/core/services/message.alert.dart';
import 'package:todo_v2/core/services/shared_prefs.dart';
import 'package:todo_v2/model/todo_model.dart';
import 'package:todo_v2/model/user_model.dart';
import 'package:todo_v2/navigation/bottom_navigation.dart';

class TodoController extends GetxController {
  static TodoController get instance => Get.find();

  final TextEditingController title = TextEditingController();
  final TextEditingController updateTitle = TextEditingController();

  final localStorage = GetStorage();
  final prefs = SharedPreferencesManager();

  Rx<bool> showSearch = false.obs;
  Rx<bool> isLoading = false.obs;

  var todoListData = <TodoModel>[].obs;

  final Rx<UserModel?> user = Rx<UserModel?>(null);

  final RxString isDone = ''.obs;

  final logger = Logger();

  @override
  Future<void> onInit() async {
    super.onInit();

    loadTodos();
  }

  Future<void> addTodo({required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState!.validate()) {
      try {
        final userId = localStorage.read('userId');

        var data = {
          "title": title.text,
          "user_id": userId,
        };

        isLoading.value = true;
        HttpResponse response = await ApiServicesClient().post(
          endpoint: addTodoEndPoint,
          data: data,
        );

        final responseData = await json.decode(response.body);

        if (responseData['status'] == 'error') {
          MessageAlert.errorSnackBar(
            responseData['message'],
          );
        } else {
          MessageAlert.showSuccessMessage(
            responseData['message'],
          );
        }
      } catch (e) {
        MessageAlert.errorSnackBar("Something went wrong!");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<List<TodoModel>> fetchTodos() async {
    final String userId = localStorage.read('userId');

    printInfo(info: 'User id: $userId');

    var data = {
      "user_id": userId,
    };

    HttpResponse response = await ApiServicesClient().post(
      endpoint: showEndPoint,
      data: data,
    );
    printInfo(info: 'Data: ${response.body}');
    final responseData = await json.decode(response.body);

    if (responseData['status'] == 'success') {
      return (responseData['data'] as List<dynamic>)
          .map((dynamic item) => TodoModel.fromJson(item))
          .toList();
    } else {
      throw Exception(responseData['message']);
    }
  }

  Future<void> loadTodos() async {
    try {
      isLoading.value = true;
      todoListData.value = await fetchTodos();
      Get.to(() => const BottomNavigation());
    } catch (e) {
      logger.e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTodo({
    required GlobalKey<FormState> formKey,
    required String id,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        var data = {
          "title": updateTitle.text,
          "id": id,
        };

        HttpResponse response = await ApiServicesClient().post(
          endpoint: updateTodoEndPoint,
          data: data,
        );

        final responseData = await json.decode(response.body);

        if (responseData['status'] == 'error') {
          MessageAlert.errorSnackBar(
            responseData['message'],
          );
        } else {
          MessageAlert.showSuccessMessage(
            responseData['message'],
          );
        }
      } catch (e) {
        logger.e(e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      var data = {
        "id": id,
      };
      HttpResponse response = await ApiServicesClient().post(
        endpoint: deleteTodoEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(
          responseData['message'],
        );
      } else {
        Get.to(() => const BottomNavigation());
        MessageAlert.showSuccessMessage(
          responseData['message'],
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> deleteMultipleTodo(String id) async {
    try {
      var data = {
        "id": id,
      };

      HttpResponse response = await ApiServicesClient().post(
        endpoint: deleteMultipleTodoEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(
          responseData['message'],
        );
      } else {
        Get.to(() => const BottomNavigation());
        MessageAlert.showSuccessMessage(
          responseData['message'],
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> doneTodo(String id, String isDone) async {
    try {
      var data = {
        "id": id,
        "is_done": isDone,
      };

      isLoading.value = true;
      HttpResponse response = await ApiServicesClient().post(
        endpoint: doneTodoEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      } else {
        if (isDone == "1") {
          MessageAlert.showSuccessMessage(responseData['message']);
        } else {
          MessageAlert.warningSnackBar("Todo not completed yet.");
        }
      }
    } catch (e) {
      MessageAlert.errorSnackBar("Something went wrong!");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    title.clear();
    updateTitle.dispose();
  }
}
