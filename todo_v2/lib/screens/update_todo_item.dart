import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/controllers/todo_item_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';

import 'package:todo_v2/shared/back_arrow_button.dart';

class UpdateTodoItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;

  const UpdateTodoItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoItemController());
    final todoController = Get.put(TodoController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.updateTitle.text = title;

      if (description.isNotEmpty) {
        controller.updateDescription.text = description;
      }
    });

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(
          onTap: () {
            Get.back();
          },
        ),
        elevation: 0,
        title: Text(
          TAppTextStrings.editTodoItemTitle,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  TextFormField(
                    controller: controller.updateTitle,
                    keyboardType: TextInputType.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: TAppTextStrings.todoTitleLabel,
                      hintText: TAppTextStrings.todoTitleHint,
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) => ValidatorService.validateTextInputs(
                      value,
                      TAppTextStrings.todoTitleLabel,
                    ),
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenItems,
                  ),
                  TextFormField(
                    controller: controller.updateDescription,
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
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenItems,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TAppColors.primaryColor,
                        padding: const EdgeInsets.all(20.0),
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onPressed: () {
                        controller.updateTodoItem(
                          formKey: formKey,
                          id: id,
                        );
                        Get.back();
                        todoController.loadTodos();
                      },
                      child: Text(
                        TAppTextStrings.updateButton,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: TAppColors.lightColor,
                            ),
                      ),
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
