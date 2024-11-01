import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/auth/screens/sign_up__second_screen.dart';

class SignUpFirstScreen extends StatelessWidget {
  const SignUpFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * .1,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hey there!",
                  style: AppStyles.primaryColorTextW700Size36,
                ),
                Text(
                  "We are Horeca Smart",
                  style: AppStyles.primaryColorTextW700Size36,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "and you're ?",
                  style: AppStyles.primaryColorTextW600Size30,
                ),
                const SizedBox(height: 30),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFormField(
                    label: AppStrings.firstName,
                    hintText: AppStrings.firstName,
                    isMandatory: true,
                    type: TextInputType.text,
                    controller: firstNameController,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomFormField(
                    label: AppStrings.lastName,
                    hintText: AppStrings.lastName,
                    isMandatory: true,
                    type: TextInputType.text,
                    controller: lastNameController,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50
            ),
            PrimaryButton(
              title: AppStrings.continueWord,
              onPressed: () {
                Get.to(() => SignUpSecondScreen(
                      firstName: firstNameController.text,
                    ));
                //  signUp();
              },
            )
          ],
        ),
      ),
    );
  }
}
