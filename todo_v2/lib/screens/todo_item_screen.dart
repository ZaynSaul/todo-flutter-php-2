import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_item_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';
import 'package:todo_v2/widgets/home/todo_list_header.dart';
import 'package:todo_v2/widgets/loading.dart';

class TodoListItemScreen extends StatefulWidget {
  const TodoListItemScreen({
    super.key,
    required this.todoId,
    required this.title,
  });

  final String todoId, title;

  @override
  State<TodoListItemScreen> createState() => _TodoListItemScreenState();
}

class _TodoListItemScreenState extends State<TodoListItemScreen> {
  final controller = Get.put(TodoItemController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadTodoItems(widget.todoId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: Obx(
        () => controller.isLoading.value == true
            ? const LoadingScreen()
            : Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: TAppSizes.spaceBetweenItems,
                    vertical: TAppSizes.sm - 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TodoListHeader(
                      title:
                          "${TAppTextStrings.completed}(${controller.countTodoItem.value})",
                      onPressed: () {
                        deleteConfirmation();
                      },
                    ),
                    // TodoListItemBuilder(
                    //   todoId: widget.todoId,
                    // ),
                  ],
                ),
              ),
      ),
      floatingActionButton: floatingButton(),
    );
  }

  Widget floatingButton() {
    return FloatingActionButton(
      backgroundColor: TAppColors.primaryColor,
      onPressed: () {
        showAddNewListItem();
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  void showAddNewListItem() {
    final isDarkMode = HelperFunctions.isDarkMode();

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: Get.context!,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? TAppColors.darkGreyColor
                  : TAppColors.secondaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: SizedBox(
              width: HelperFunctions.screenWidth(),
              height: HelperFunctions.screenHeight() / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    TAppTextStrings.addTodoItemTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: TAppSizes.spaceBetweenItems),
                  // const AddTodoItem(),
                ],
              ),
            ),
          );
        });
  }

  void deleteConfirmation() {
    final isDarkMode = HelperFunctions.isDarkMode();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor:
              isDarkMode ? TAppColors.darkGreyColor : TAppColors.whiteColor,
          title: Text(
            TAppTextStrings.deleteConfirmationTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          content: Text(
            TAppTextStrings.deleteConfirmation,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: TAppColors.dangerColor,
                ),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            cancel(),
            delete(),
          ],
        );
      },
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

  Widget delete() {
    return TextButton(
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          TAppColors.successColor.withOpacity(0.4),
        ),
      ),
      child: Text(
        "${TAppTextStrings.yesButton}, delete",
        style: Theme.of(Get.context!)
            .textTheme
            .bodyMedium!
            .apply(color: TAppColors.successColor),
      ),
    );
  }

  AppBar appBar(String title) {
    return AppBar(
      leading: const BackArrowButton(),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
