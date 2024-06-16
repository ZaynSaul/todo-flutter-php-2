import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/todo_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';

class UpdateTodo extends StatelessWidget {
  final String title;
  final String id;

  const UpdateTodo({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(TodoController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.updateTitle.text = title;
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TAppColors.primaryColor,
                        padding: const EdgeInsets.all(20.0),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        controller.updateTodo(
                          formKey: formKey,
                          id: id,
                        );
                        controller.loadTodos();
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
