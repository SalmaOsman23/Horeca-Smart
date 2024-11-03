import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class HelpAndSupportSecondScreen extends StatelessWidget {
  const HelpAndSupportSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    return ScreenLayout(
        appBarTitle: AppStrings.helpAndSupport,
        body: BlocProvider(
          create: (context) => HomeCubit(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // if (state is ContactUsSuccessState) {
              //   showToast(
              //       message: "your message is sent successfully",
              //       state: ToastStates.success);
              //   Get.back();
              // }
            },
            builder: (context, state) {
              HomeCubit homeCubit = HomeCubit.get(context);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            AppStrings.howCanWeHelpYouToday,
                            style: AppStyles.primaryColorTextW600Size24,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        label: "",
                        isMandatory: false,
                        hintText: AppStrings.email,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        label: "",
                        isMandatory: false,
                        hintText: AppStrings.writeYourMessage,
                        controller: messageController,
                        textArea: true,
                        type: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        title: AppStrings.submit,
                        onPressed: () {
                         
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
