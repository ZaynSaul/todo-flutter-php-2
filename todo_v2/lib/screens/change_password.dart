import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/auth_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';
import 'package:todo_v2/shared/back_arrow_button.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: BackArrowButton(
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          TAppTextStrings.changePasswordTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TAppSizes.spaceBetweenItems),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: TAppSizes.spaceBetweenItems,
                    ),
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.password,
                      obscureText: controller.hidePassword.value,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: TAppTextStrings.oldPasswordLabel,
                        hintText: TAppTextStrings.oldPasswordHint,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.hidePassword.value =
                                !controller.hidePassword.value;
                          },
                          child: Icon(
                            controller.hidePassword.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) =>
                          ValidatorService.validatePassword(value),
                    ),
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenItems,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.newPassword,
                      obscureText: controller.hideNewPassword.value,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: TAppTextStrings.newPasswordLabel,
                        hintText: TAppTextStrings.newPasswordHint,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.hideNewPassword.value =
                                !controller.hideNewPassword.value;
                          },
                          child: Icon(
                            controller.hideNewPassword.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) => ValidatorService.validatePassword(
                        value,
                        oldPassword: controller.password.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenItems,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.confirmPassword,
                      obscureText: controller.hideConfirmPassword.value,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyMedium,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: TAppTextStrings.passwordConfirmationLabel,
                        hintText: TAppTextStrings.passwordConfirmationHint,
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.hideConfirmPassword.value =
                                !controller.hideConfirmPassword.value;
                          },
                          child: Icon(
                            controller.hideConfirmPassword.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) => ValidatorService.validatePassword(
                        value,
                        confirmPassword: controller.newPassword.text,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TAppSizes.spaceBetweenInputFields,
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () => controller.changePassword(
                          formKey: formKey,
                        ),
                        child: controller.isLoading.value == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const CircularProgressIndicator(
                                      color: Colors.pink),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    'Loading in...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                          color: TAppColors.lightColor,
                                        ),
                                  ),
                                ],
                              )
                            : Text(
                                TAppTextStrings.updateButton,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: TAppColors.lightColor,
                                    ),
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
