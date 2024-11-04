import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/enums/show_toast.dart';
import 'package:horeca_smart/core/layouts/app_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/auth/auth_service.dart/auth_service.dart';
import 'package:horeca_smart/features/auth/screens/sign_up_first_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    signIn() async {
      final user = await auth.logInUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        log("User Created Successfully!");
        showToast(message: "Logged in successfully", state: ToastStates.success);
        Get.offAll(() => const AppLayout());
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Log In",
                  style: AppStyles.primaryColorTextW700Size36,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Get started for a seamless shopping experience",
              style: AppStyles.greyTextW600Size18,
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height / 25),
            CustomFormField(
              label: AppStrings.email,
              hintText: AppStrings.enterYourEmail,
              isMandatory: true,
              type: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 20),
            CustomFormField(
              label: AppStrings.password,
              hintText: AppStrings.enterYourPassword,
              isPassword: true,
              isMandatory: true,
              type: TextInputType.text,
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.doNotHaveAnAccount,
                  style: AppStyles.primaryColorTextW600Size12,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUpFirstScreen());
                  },
                  child: Text(
                    AppStrings.createOne,
                    style: AppStyles.primaryColorTextW600Size14Underlined,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              title: AppStrings.logIn,
              onPressed: () {
                signIn();
              },
            )
          ],
        ),
      ),
    );
  }
}
