import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/widgets/home/add_todo.dart';
import 'package:todo_v2/widgets/home/home_profile.dart';
import 'package:todo_v2/widgets/home/list_search_box.dart';
import 'package:todo_v2/widgets/home/todo_list_builder.dart';
import 'package:todo_v2/widgets/home/todo_list_header.dart';
import 'package:todo_v2/widgets/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();
    final controller = Get.put(TodoController());
    final localStorage = GetStorage();
    final user = localStorage.read('user');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(
          () => controller.showSearch.value == true
              ? ListSearchBox(controller: controller)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TAppTextStrings.todoTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.00),
                            border: Border.all(
                              width: 1,
                              color: isDarkMode
                                  ? TAppColors.mediumDarkColor.withOpacity(0.4)
                                  : TAppColors.greyColor.withOpacity(0.4),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                controller.loadTodos();
                              },
                              icon: const Icon(Icons.refresh_rounded, size: 24),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.00),
                            border: Border.all(
                              width: 1,
                              color: isDarkMode
                                  ? TAppColors.mediumDarkColor.withOpacity(0.4)
                                  : TAppColors.greyColor.withOpacity(0.4),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                controller.showSearch.value = true;
                              },
                              icon: const Icon(Icons.search_rounded, size: 24),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const HomeProfile()
                      ],
                    ),
                  ],
                ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingScreen()
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TodoListHeader(
                      title: TAppTextStrings.allLists,
                      onPressed: () {
                        deleteConfirmation();
                      },
                    ),
                    const TodoListBuilder(),
                  ],
                ),
              ),
      ),
      floatingActionButton: floatingButton(user),
    );
  }

  Widget floatingButton(final user) {
    return FloatingActionButton(
      backgroundColor: TAppColors.primaryColor,
      onPressed: () {
        showAddNewList(user);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  void showAddNewList(final user) {
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
              bottom: MediaQuery.of(Get.context!).viewInsets.bottom,
            ),
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
              height: HelperFunctions.screenHeight() / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(TAppTextStrings.aboutTitle,
                      style: Theme.of(Get.context!).textTheme.bodyMedium),
                  const SizedBox(height: TAppSizes.spaceBetweenItems),
                  const AddTodo(),
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
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: <Widget>[
              cancel(),
              delete(),
            ],
          );
        });
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
        style: Theme.of(Get.context!).textTheme.bodyMedium!.apply(
              color: TAppColors.successColor,
            ),
      ),
    );
  }
}
