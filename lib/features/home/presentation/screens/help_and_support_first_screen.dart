import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/screens/help_and_support_second_screen.dart';

class HelpAndSupportFirstScreen extends StatefulWidget {
  const HelpAndSupportFirstScreen({super.key});

  @override
  State<HelpAndSupportFirstScreen> createState() =>
      _HelpAndSupportFirstScreenState();
}

class _HelpAndSupportFirstScreenState extends State<HelpAndSupportFirstScreen> {
  bool isShowFirstAnswer = false;
  bool isShowSecondAnswer = false;
  bool isShowThirdAnswer = false;
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBarTitle: AppStrings.helpAndSupport,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.fAQ,
                          style: AppStyles.primaryColorTextW600Size18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //!First FAQ
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowFirstAnswer = !isShowFirstAnswer;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.firstFAQ,
                            style: AppStyles.primaryColorTextW600Size14,
                          ),
                          Icon(
                            isShowFirstAnswer
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryColor,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isShowFirstAnswer)
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            AppStrings.firstFAQAnswer,
                            style: AppStyles.greyTextW600Size18,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    //!Second FAQ
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowSecondAnswer = !isShowSecondAnswer;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.secondFAQ,
                            style: AppStyles.primaryColorTextW600Size14,
                          ),
                          Icon(
                            isShowSecondAnswer
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryColor,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (isShowSecondAnswer)
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            AppStrings.secondFAQAnswer,
                            style: AppStyles.greyTextW600Size18,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 10),
                    //!Third FAQ
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowThirdAnswer = !isShowThirdAnswer;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.thirdFAQ,
                            style: AppStyles.primaryColorTextW600Size14,
                          ),
                          Icon(
                            isShowThirdAnswer
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: AppColors.primaryColor,
                            size: 28,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (isShowThirdAnswer)
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            AppStrings.thirdFAQAnswer,
                            style: AppStyles.greyTextW600Size18,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              children: [
                Text(
                  AppStrings.helpIsAMailAway,
                  style: AppStyles.primaryColorTextW600Size16,
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryButton(
                  title: AppStrings.sendAMessage,
                  onPressed: () {
                    Get.to(() => const HelpAndSupportSecondScreen());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
