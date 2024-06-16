import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_v2/controllers/auth_controller.dart';
import 'package:todo_v2/core/constants/app_colors.dart';
import 'package:todo_v2/core/constants/app_sizes.dart';
import 'package:todo_v2/core/constants/text_strings.dart';
import 'package:todo_v2/core/services/validator.dart';
import 'package:todo_v2/screens/login_screen.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: TAppSizes.spaceBetweenItems,
            ),
            child: Text(
              TAppTextStrings.registerTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextFormField(
            controller: controller.name,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: TAppTextStrings.nameLabel,
              hintText: TAppTextStrings.nameHint,
              prefixIcon: Icon(
                Icons.person,
              ),
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) => ValidatorService.validateTextInputs(
                value, TAppTextStrings.nameLabel),
          ),
          const SizedBox(
            height: TAppSizes.spaceBetweenItems,
          ),
          TextFormField(
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              labelText: TAppTextStrings.emailLabel,
              hintText: TAppTextStrings.emailHint,
              prefixIcon: Icon(
                Icons.email,
              ),
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.next,
            validator: (value) => ValidatorService.validateEmail(value),
          ),
          const SizedBox(
            height: TAppSizes.spaceBetweenItems,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              style: Theme.of(context).textTheme.bodyMedium,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                labelText: TAppTextStrings.passwordLabel,
                hintText: TAppTextStrings.passwordHint,
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
                border: InputBorder.none,
              ),
              validator: (value) => ValidatorService.validatePassword(value),
            ),
          ),
          const SizedBox(
            height: TAppSizes.spaceBetweenItems,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Obx(
              () => ElevatedButton(
                onPressed: () => controller.register(
                  formKey: formKey,
                ),
                child: controller.isLoading.value == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(color: Colors.pink),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            'Loading in...',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
                                      color: TAppColors.lightColor,
                                    ),
                          ),
                        ],
                      )
                    : const Text(
                        TAppTextStrings.registerButton,
                        style: TextStyle(
                            color: TAppColors.whiteColor, fontSize: 18),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: TAppSizes.spaceBetweenItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                TAppTextStrings.alreadyHaveAccount,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Text(
                  TAppTextStrings.loginButton,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: TAppColors.primaryColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
