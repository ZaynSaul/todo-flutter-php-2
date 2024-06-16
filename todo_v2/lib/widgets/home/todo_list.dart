import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/screens/update_todo.dart';

class TodoList extends StatelessWidget {
  final String id;
  final String title;
  final String isDone;
  final int index;

  const TodoList({
    super.key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        key: ValueKey(id),
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => editTodo(),
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) =>
                  deleteConfirmationModal(context, controller),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: ListTile(
          onTap: () => editTodo(),
          leading: IconButton(
            onPressed: () {
              if (isDone == "1") {
                controller.doneTodo(id, '0');
              } else {
                controller.doneTodo(id, '1');
              }

              controller.loadTodos();
            },
            icon: isDone == "1"
                ? const Icon(
                    Icons.check_box_rounded,
                    color: TAppColors.primaryColor,
                  )
                : const Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: TAppColors.mediumGreyColor,
                  ),
            iconSize: 20,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: TAppSizes.fontSizeSm,
              fontWeight: FontWeight.w500,
              decoration: isDone == "1" ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: isDone == "1"
              ? const Icon(
                  Icons.check_rounded,
                  size: 24,
                  color: Colors.green,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  void editTodo() {
    Get.to(
      () => UpdateTodo(
        id: id,
        title: title,
      ),
    );
  }

  void deleteConfirmationModal(
      BuildContext context, TodoController controller) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(TAppTextStrings.deleteConfirmationTitle),
        content: const Text(
          TAppTextStrings.deleteConfirmation,
          style: TextStyle(
            color: TAppColors.dangerColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          cancel(),
          delete(controller),
        ],
      ),
    );
  }

  Widget cancel() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          TAppColors.dangerColor.withOpacity(0.4),
        ),
      ),
      child: Text(
        TAppTextStrings.cancelButton,
        style: Theme.of(Get.context!)
            .textTheme
            .bodyMedium!
            .apply(color: TAppColors.dangerColor),
      ),
    );
  }

  Widget delete(TodoController controller) {
    return TextButton(
      onPressed: () {
        Get.back(); // Close the confirmation dialog
        controller.deleteTodo(id);
        controller.loadTodos(); // Perform the deletion
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          TAppColors.successColor.withOpacity(0.4),
        ),
      ),
      child: Text(
        "${TAppTextStrings.yesButton}, delete",
        style: Theme.of(Get.context!).textTheme.bodyMedium!.apply(
              color: TAppColors.successColor,
            ),
      ),
    );
  }
}
