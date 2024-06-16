import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/profile_controller.dart';
import 'package:todo_v2/controllers/tab_bar_controller.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/controllers/todo_item_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_images.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/helper/helper_functions.dart';
import 'package:todo_v2/env.dart';
import 'package:todo_v2/screens/add_todo_item.dart';
import 'package:todo_v2/shared/tab_bar.dart';
import 'package:todo_v2/widgets/home/add_todo.dart';
import 'package:todo_v2/widgets/home/list_search_box.dart';
import 'package:todo_v2/widgets/home/todo_list_builder.dart';
import 'package:todo_v2/widgets/home/todo_list_item_builder.dart';
import 'package:todo_v2/widgets/loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());
    final tabBarController = Get.put(TabBarController());

    final isDarkMode = HelperFunctions.isDarkMode();

    return Obx(
      () => DefaultTabController(
        length: todoController.todoListData.length,
        child: Scaffold(
          appBar: buildAppBar(
            context,
            todoController,
            isDarkMode,
          ),
          body: buildBody(
            todoController,
            context,
            isDarkMode,
            tabBarController.tabController,
          ),
          floatingActionButton: buildFloatingButton(
            todoController,
            tabBarController.tabController,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(
    BuildContext context,
    TodoController controller,
    bool isDarkMode,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Obx(
        () => controller.showSearch.value
            ? ListSearchBox(controller: controller)
            : buildTitleRow(
                context,
                controller,
                isDarkMode,
              ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Row buildTitleRow(
    BuildContext context,
    TodoController controller,
    bool isDarkMode,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          TAppTextStrings.todoTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        buildActionIcons(
          controller,
          isDarkMode,
        ),
      ],
    );
  }

  Row buildActionIcons(
    TodoController controller,
    bool isDarkMode,
  ) {
    return Row(
      children: [
        buildIconButton(
          () => controller.loadTodos(),
          Icons.refresh_rounded,
          isDarkMode,
        ),
        const SizedBox(width: 10),
        buildIconButton(
          () => _showSearch(controller),
          Icons.search_rounded,
          isDarkMode,
        ),
        const SizedBox(
          width: 10,
        ),
        buildProfileIcon(),
      ],
    );
  }

  void _showSearch(TodoController controller) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.showSearch.value = true;
    });
  }

  Container buildIconButton(
    VoidCallback onPressed,
    IconData icon,
    bool isDarkMode,
  ) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: isDarkMode
              ? TAppColors.mediumDarkColor.withOpacity(0.4)
              : TAppColors.greyColor.withOpacity(0.4),
        ),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 24,
          ),
        ),
      ),
    );
  }

  Container buildProfileIcon() {
    final profileController = Get.put(ProfileController());
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: profileController.userData.value.profile.isEmpty &&
                  profileController.userData.value.profile == ""
              ? Image.asset(
                  TAppImages.defaultProfile,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  AppEnvironment.profileBaseURL +
                      profileController.userData.value.profile,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  Widget buildBody(
    TodoController controller,
    BuildContext context,
    bool isDarkMode,
    TabController tabController,
  ) {
    if (controller.isLoading.value) {
      return const Center(
        child: LoadingScreen(),
      );
    } else if (controller.todoListData.isEmpty) {
      return buildNoList(context);
    } else {
      return buildTodoListView(
        controller,
        context,
        isDarkMode,
        tabController,
      );
    }
  }

  Widget buildTodoListView(
    TodoController controller,
    BuildContext context,
    bool isDarkMode,
    TabController tabController,
  ) {
    final tabs = <Tab>[];
    final views = <Widget>[];

    for (var todo in controller.todoListData) {
      tabs.add(
        Tab(
          child: Text(
            todo.title,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      );

      final todoItems = todo.items;
      views.add(
        todoItems!.isNotEmpty
            ? TodoListItemBuilder(
                todoId: todo.id,
                todoItems: todoItems,
                tabIndex: tabController.index,
              )
            : buildNoTask(),
      );
    }

    return NestedScrollView(
      headerSliverBuilder: (_, innerBoxIsScrolled) => [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          snap: true,
          floating: true,
          expandedHeight: 100,
          flexibleSpace: buildFlexibleSpace(
            context,
            isDarkMode,
            tabController,
          ),
          bottom: CustomTabBar(tabs: tabs),
        ),
      ],
      body: TabBarView(
        controller: tabController,
        children: views,
      ),
    );
  }

  Padding buildFlexibleSpace(
    BuildContext context,
    bool isDarkMode,
    TabController tabController,
  ) {
    return Padding(
      padding: const EdgeInsets.all(
        TAppSizes.sm,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          buildListHeader(
            context,
            isDarkMode,
            tabController,
          ),
        ],
      ),
    );
  }

  Row buildListHeader(
    BuildContext context,
    bool isDarkMode,
    TabController tabController,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: showLists,
              icon: Icon(
                Icons.list_alt_rounded,
                color: isDarkMode
                    ? TAppColors.greyColor
                    : TAppColors.mediumDarkColor,
              ),
            ),
            const SizedBox(
              width: TAppSizes.sm,
            ),
            IconButton(
              onPressed: () => listItemActions(
                context,
                tabController,
              ),
              icon: Icon(
                Icons.more_horiz_rounded,
                color: isDarkMode
                    ? TAppColors.greyColor
                    : TAppColors.mediumDarkColor,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: addNewList,
          child: Row(
            children: [
              Text(
                "New List",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Icon(Icons.add,
                  color: isDarkMode
                      ? TAppColors.greyColor
                      : TAppColors.mediumDarkColor,
                  size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFloatingButton(
    TodoController todoController,
    TabController tabController,
  ) {
    return Obx(() {
      if (todoController.todoListData.isNotEmpty) {
        return FloatingActionButton(
          backgroundColor: TAppColors.primaryColor,
          onPressed: () async {
            var result = await Get.to(
              () => AddTodoItem(
                index: tabController.index,
              ),
            );
            if (result != null && result is int) {
              tabController.index = result;
              todoController.loadTodos();
            }
          },
          child: const Icon(
            Icons.add,
            color: TAppColors.whiteColor,
            size: 30,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }

  Widget buildNoTask() {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: TAppSizes.spaceBetweenItems,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              TAppImages.noTodo,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Text(
              TAppTextStrings.noTodoList,
              style: Theme.of(Get.context!).textTheme.titleSmall,
            ),
            const SizedBox(
              height: TAppSizes.md,
            ),
            Text(
              TAppTextStrings.noTodoLitDescription,
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNoList(BuildContext context) {
    final isDarkMode = HelperFunctions.isDarkMode();

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(
        horizontal: TAppSizes.spaceBetweenSections,
        vertical: TAppSizes.spaceBetweenItems,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TAppImages.noTodo,
                height: 200, width: 200, fit: BoxFit.cover),
            Text(
              TAppTextStrings.noTodoList,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: TAppSizes.md),
            Text(
              TAppTextStrings.noTodoLitDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: TAppSizes.spaceBetweenItems,
            ),
            TextButton(
              onPressed: addNewList,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  TAppColors.greyColor.withOpacity(0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New List",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  Icon(Icons.add,
                      color: isDarkMode
                          ? TAppColors.greyColor
                          : TAppColors.mediumDarkColor,
                      size: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addNewList() {
    final isDarkMode = HelperFunctions.isDarkMode();
    showModalBottomSheet(
      backgroundColor: TAppColors.transparentColor,
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
                Text(
                  TAppTextStrings.addTodoTitle,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: TAppSizes.spaceBetweenItems,
                ),
                const AddTodo(),
              ],
            ),
          ),
        );
      },
    );
  }

  void showLists() {
    final isDarkMode = HelperFunctions.isDarkMode();
    showModalBottomSheet(
      backgroundColor: TAppColors.transparentColor,
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
            height: HelperFunctions.screenHeight(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildListsHeader(),
                const Divider(),
                const SizedBox(
                  height: TAppSizes.md,
                ),
                const Expanded(
                  child: TodoListBuilder(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row buildListsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          TAppTextStrings.allLists,
          style: Theme.of(Get.context!).textTheme.bodyMedium,
        ),
        IconButton(
          onPressed: () => Navigator.pop(Get.context!),
          icon: const Icon(
            Icons.cancel,
            color: TAppColors.dangerColor,
          ),
        ),
      ],
    );
  }

  Row buildAddTodoItemHeader(
    TodoItemController todoItemController,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(TAppTextStrings.addTodoItemTitle,
            style: Theme.of(Get.context!).textTheme.bodyMedium),
        IconButton(
          onPressed: () {
            Navigator.pop(Get.context!);
            todoItemController.showDescription.value = false;
          },
          icon: const Icon(Icons.cancel, color: TAppColors.dangerColor),
        ),
      ],
    );
  }

  void listItemActions(BuildContext context, TabController tabController) {
    final isDarkMode = HelperFunctions.isDarkMode();
    final controller = Get.put(TodoItemController());

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: isDarkMode
                ? TAppColors.darkGreyColor
                : TAppColors.secondaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: SizedBox(
            width: HelperFunctions.screenWidth(),
            height: HelperFunctions.screenHeight() / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildListItemActionHeader(context),
                const Divider(),
                const SizedBox(height: TAppSizes.spaceBetweenItems),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    deleteConfirmationModal(context, controller, tabController);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      TAppColors.greyColor.withOpacity(
                        0.4,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.delete_sweep_rounded,
                        color: TAppColors.dangerColor,
                      ),
                      const SizedBox(
                        width: TAppSizes.md,
                      ),
                      Text(
                        "Delete all completed list",
                        style: Theme.of(Get.context!).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row buildListItemActionHeader(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("List item actions",
            style: Theme.of(context).textTheme.bodyMedium),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.cancel, color: TAppColors.dangerColor),
        ),
      ],
    );
  }

  void deleteConfirmationModal(
    BuildContext context,
    TodoItemController controller,
    TabController tabController,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Are you sure you want to delete all completed todo items?",
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
          delete(controller, tabController.index),
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
    int index,
  ) {
    final todoController = Get.put(TodoController());
    final todoId = todoController.todoListData[index].id;
    return TextButton(
      onPressed: () {
        controller.deleteCompletedTodoItem(todoId);
        Get.back();
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
