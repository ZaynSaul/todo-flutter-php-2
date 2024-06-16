import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/controllers/todo_item_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/screens/update_todo_item.dart';

class SubTodoItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String isDone;
  final String todoId;

  final int index;

  const SubTodoItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
    required this.todoId,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoItemController());
    final todoController = Get.put(TodoController());

    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Slidable(
        key: ValueKey(id),
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => editTodoItem(),
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
              onPressed: (context) => deleteConfirmationModal(
                context,
                controller,
                todoController,
                index,
              ),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: ListTile(
          onTap: () => editTodoItem(),
          leading: IconButton(
            onPressed: () {
              if (isDone == "1") {
                controller.doneTodoItem(id, '0');
                Get.back(result: index);

                todoController.loadTodos();
              } else {
                controller.doneTodoItem(id, '1');
                Get.back(result: index);

                todoController.loadTodos();
              }
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
          title: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: TAppSizes.fontSizeSm,
                  fontWeight: FontWeight.w500,
                  decoration: isDone == "1" ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
          subtitle: description.isNotEmpty
              ? Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: TAppSizes.fontSizeSm - 2,
                            fontWeight: FontWeight.w500,
                            decoration: isDone == "1"
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            child: isDone == "1"
                ? const Icon(
                    Icons.check_rounded,
                    size: 24,
                    color: Colors.green,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  void editTodoItem() {
    Get.to(
      () => UpdateTodoItem(
        id: id,
        title: title,
        description: description,
      ),
    );
  }

  void deleteConfirmationModal(
    BuildContext context,
    TodoItemController controller,
    TodoController todoController,
    int index,
  ) {
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
          delete(
            controller,
            todoController,
            index,
          ),
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

  Widget delete(
    TodoItemController controller,
    TodoController todoController,
    int index,
  ) {
    return TextButton(
      onPressed: () {
        controller.deleteTodoItem(id);
        Get.back(result: index);

        todoController.loadTodos();
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
