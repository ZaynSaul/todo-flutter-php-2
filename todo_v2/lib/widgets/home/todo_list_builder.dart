import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/model/todo_model.dart';
import 'package:todo_v2/widgets/home/todo_list.dart';

class TodoListBuilder extends StatelessWidget {
  const TodoListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());

    final List<TodoModel> todoList = controller.todoListData;

    return Scaffold(
      body: Obx(
        () => todoList.isEmpty
            ? noTask()
            : ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (_, index) {
                  return TodoList(
                    id: todoList[index].id,
                    title: todoList[index].title,
                    isDone: todoList[index].isDone,
                    index: index,
                  );
                },
              ),
      ),
    );
  }

  Widget noTask() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/images/goals.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: TAppSizes.md,
            ),
            Text(
              TAppTextStrings.noTodoLitDescription,
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
