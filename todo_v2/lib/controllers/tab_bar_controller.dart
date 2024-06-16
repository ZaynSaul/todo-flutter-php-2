import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/model/todo_model.dart';

class TabBarController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    final todoController = Get.put(TodoController());
    tabController = TabController(
      length: todoController.todoListData.length,
      vsync: this,
    );

    // Update the TabController length dynamically when todoListData changes
    ever(todoController.todoListData, (List<TodoModel> todoListData) {
      tabController = TabController(
        length: todoListData.length,
        vsync: this,
      );
      update(); // Notify listeners about the change
    });

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
