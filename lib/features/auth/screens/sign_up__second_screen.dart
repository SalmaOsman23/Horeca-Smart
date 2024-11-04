import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/layouts/app_layout.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/auth/auth_service.dart/auth_service.dart';

class SignUpSecondScreen extends StatelessWidget {
  const SignUpSecondScreen({super.key, required this.firstName});
  final String firstName;

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    signUp() async {
      final user = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (user != null) {
        log("User Created Successfully!");
        Get.offAll(() => const AppLayout());
      }
    }

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
            ),
            Row(
              children: [
                Text(
                  "Hi, $firstName",
                  style: AppStyles.primaryColorTextW700Size36,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Please fill the information below",
                  style: AppStyles.greyTextW600Size18,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Column(
              children: [
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
                )
              ],
            ),
            const SizedBox(height: 50),
            PrimaryButton(
              title: AppStrings.signUp,
              onPressed: () {
                signUp();
              },
            )
          ],
        ),
      ),
    );
  }
}
