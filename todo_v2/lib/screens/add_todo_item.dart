import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/controllers/todo_item_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';

class AddTodoItem extends StatelessWidget {
  const AddTodoItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoItemController());
    final todoController = Get.put(TodoController());

    final todoId = todoController.todoListData[index].id;
    final formKey = GlobalKey<FormState>();

    printInfo(info: 'Todo id: $todoId');

    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(
          onTap: () {
            Get.back();
          },
        ),
        elevation: 0,
        title: Text(
          TAppTextStrings.addTodoItemTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TAppSizes.spaceBetweenItems,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller.title,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: TAppTextStrings.todoTitleLabel,
                      hintText: TAppTextStrings.todoTitleHint,
                    ),
                    validator: (value) => ValidatorService.validateTextInputs(
                      value,
                      TAppTextStrings.todoTitleLabel,
                    ),
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenItems,
                  ),
                  Obx(
                    () {
                      if (controller.showDescription.value == true) {
                        return TextFormField(
                          controller: controller.description,
                          maxLines: null,
                          maxLength: 300,
                          keyboardType: TextInputType.multiline,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText:
                                "${TAppTextStrings.descriptionLabel}(optional)",
                            hintText: TAppTextStrings.descriptionHint,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: TAppSizes.spaceBetweenItems,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.showDescription.value =
                                !controller.showDescription.value;
                          },
                          icon: const Icon(
                            Icons.list,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.addTodoItem(
                              formKey: formKey,
                              todoId: todoId,
                            );

                            Get.back(result: index);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              TAppColors.successColor.withOpacity(0.1),
                            ),
                          ),
                          child: Text(
                            TAppTextStrings.saveButton,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(color: TAppColors.successColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
