import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_v2/model/todo_item_model.dart';
import 'package:todo_v2/widgets/home/sub_todo_item.dart';

class TodoListItemBuilder extends StatelessWidget {
  const TodoListItemBuilder({
    super.key,
    required this.todoId,
    required this.todoItems,
    required this.tabIndex,
  });

  final String todoId;
  final List<TodoItemModel> todoItems;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final localStorage = GetStorage();
    localStorage.write('todoId', todoId);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return SubTodoItem(
            id: todoItems[index].id,
            title: todoItems[index].title,
            description: todoItems[index].description,
            isDone: todoItems[index].isDone,
            todoId: todoId,
            index: tabIndex,
          );
        },
      ),
    );
  }

  Widget completedTasks() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: todoItems.length,
        itemBuilder: (context, index) {
          return SubTodoItem(
            id: todoItems[index].id,
            title: todoItems[index].title,
            description: todoItems[index].description,
            isDone: todoItems[index].isDone,
            todoId: todoId,
            index: tabIndex,
          );
        },
      ),
    );
  }
}
