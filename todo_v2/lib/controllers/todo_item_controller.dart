import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:todo_v2/core/services/api_service_client.dart';
import 'package:todo_v2/core/services/global_services.dart';
import 'package:todo_v2/core/services/message.alert.dart';
import 'package:todo_v2/core/services/shared_prefs.dart';
import 'package:todo_v2/model/todo_item_model.dart';
import 'package:todo_v2/navigation/bottom_navigation.dart';

class TodoItemController extends GetxController {
  static TodoItemController get instance => Get.find();

  final TextEditingController title = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController updateTitle = TextEditingController();

  final TextEditingController updateDescription = TextEditingController();

  final localStorage = GetStorage();
  final prefs = SharedPreferencesManager();

  Rx<bool> showSearch = false.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> showDescription = false.obs;

  var todoListItemData = <TodoItemModel>[].obs;
  var countTodoItem = ''.obs;

  RxString todoId = ''.obs;

  final logger = Logger();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> addTodoItem({
    required GlobalKey<FormState> formKey,
    required String todoId,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        final userId = localStorage.read('userId');
        isLoading.value = true;
        var data = {
          "title": title.text,
          "description": description.text,
          "todo_id": todoId,
          "user_id": userId,
        };

        HttpResponse response = await ApiServicesClient().post(
          endpoint: addTodoItemEndPoint,
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

  Future<List<TodoItemModel>> fetchCompletedTodoItems(String id) async {
    var data = {
      "todo_id": id,
    };

    HttpResponse response = await ApiServicesClient().post(
      endpoint: showCompletedEndItemPoint,
      data: data,
    );

    final jsonData = await json.decode(response.body);

    if (jsonData['status'] == 'success') {
      return (jsonData['data'] as List<dynamic>)
          .map((dynamic item) => TodoItemModel.fromJson(item))
          .toList();
    } else {
      throw Exception(jsonData['message']);
    }
  }

  Future<void> loadCompletedTodoItems(String id) async {
    try {
      isLoading.value = true;
      todoListItemData.value = await fetchTodoItems(id);
      countTodoItems(id);
    } catch (e) {
      logger.e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<TodoItemModel>> fetchTodoItems(String id) async {
    var data = {
      "todo_id": id,
    };

    HttpResponse response = await ApiServicesClient().post(
      endpoint: showEndItemPoint,
      data: data,
    );
    printInfo(info: 'Data: ${response.body}');

    final jsonData = await json.decode(response.body);

    if (jsonData['status'] == 'success') {
      return (jsonData['data'] as List<dynamic>)
          .map((dynamic item) => TodoItemModel.fromJson(item))
          .toList();
    } else {
      throw Exception(jsonData['message']);
    }
  }

  Future<void> loadTodoItems(String id) async {
    try {
      isLoading.value = true;
      todoListItemData.value = await fetchTodoItems(id);
      Get.to(() => const BottomNavigation());
      countTodoItems(id);
    } catch (e) {
      logger.e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTodoItem({
    required GlobalKey<FormState> formKey,
    required String id,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        var data = {
          "title": updateTitle.text,
          "description": updateDescription.text,
          "id": id,
        };

        HttpResponse response = await ApiServicesClient().post(
          endpoint: updateTodoItemEndPoint,
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
  }

  Future<void> deleteTodoItem(String id) async {
    try {
      var data = {
        "id": id,
      };
      HttpResponse response = await ApiServicesClient().post(
        endpoint: deleteTodoItemEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      } else {
        Get.to(() => const BottomNavigation());
        MessageAlert.showSuccessMessage(responseData['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> deleteCompletedTodoItem(
    String todoId,
  ) async {
    try {
      final userId = localStorage.read('userId');

      var data = {
        "user_id": userId,
        'todo_id': todoId,
      };
      HttpResponse response = await ApiServicesClient().post(
        endpoint: deleteCompleteItemEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      } else {
        Get.to(() => const BottomNavigation());
        MessageAlert.showSuccessMessage(responseData['message']);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> doneTodoItem(
    String id,
    String isDone,
  ) async {
    try {
      var data = {
        "id": id,
        "is_done": isDone,
      };
      HttpResponse response = await ApiServicesClient().post(
        endpoint: doneTodoItemEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      } else {
        Get.to(() => const BottomNavigation());
        if (isDone == "1") {
          MessageAlert.showSuccessMessage(responseData['message']);
        } else {
          MessageAlert.warningSnackBar("Todo not completed yet.");
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> countTodoItems(String id) async {
    try {
      var data = {
        "todo_id": id,
      };
      HttpResponse response = await ApiServicesClient().post(
        endpoint: countTodoItemEndPoint,
        data: data,
      );

      final responseData = await json.decode(response.body);

      if (responseData['status'] == 'error') {
        MessageAlert.errorSnackBar(responseData['message']);
      } else {
        Get.to(() => const BottomNavigation());

        countTodoItem.value = responseData['count'];
      }
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
    title.clear();
    description.clear();
    updateTitle.dispose();
    updateDescription.dispose();
  }
}
