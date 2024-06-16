import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(TodoController());
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller.title,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: TAppTextStrings.todoTitleLabel,
              hintText: TAppTextStrings.todoTitleHint,
            ),
            validator: (value) => ValidatorService.validateTextInputs(
              value,
              TAppTextStrings.todoTitleLabel,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: TAppSizes.spaceBetweenItems,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    TAppColors.dangerColor.withOpacity(0.1),
                  )),
                  child: Text(
                    "Cancel",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TAppColors.dangerColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    controller.addTodo(formKey: formKey);
                    Get.back();
                    controller.loadTodos();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    TAppColors.successColor.withOpacity(0.1),
                  )),
                  child: Text(
                    "Save",
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
    );
  }
}
