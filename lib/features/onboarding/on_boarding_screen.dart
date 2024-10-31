import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/layouts/app_layout.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/auth/screens/log_in_screen.dart';
import 'package:horeca_smart/features/auth/screens/sign_up_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static List<Map<String, String>> content = [
    {
      'imgPath': AppAssets.mobileWithCartIllustration,
      'title': "Shop Online With Affordable Prices",
      'subTitle': "Explore a wide range of products at unbeatable prices"
    },
    {
      'imgPath': AppAssets.womanDoingShoppingIllustration,
      'title': "Enhance Your Online Shopping Experience",
      'subTitle':
          "Conveniently browse and order your daily essentials from home."
    },
    {
      'imgPath': AppAssets.homeDeliveryServicesIllustration,
      'title': "Receive Your Essentials Hassle-Free ",
      'subTitle': "Get your essentials delivered straight to your door."
    },
  ];

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: content.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, item) {
                  return Column(
                    children: [
                      Expanded(
                        child: SizedBox.expand(
                          child: Stack(
                            children: [
                              Positioned(
                                  top: MediaQuery.sizeOf(context).height / 12,
                                  left: 10,
                                  right: 10,
                                  child: Text(
                                    AppStrings.horecaSmart.toUpperCase(),
                                    style: AppStyles.whiteColorTextW600Size24,
                                    textAlign: TextAlign.center,
                                  )),
                              const SizedBox(
                                height: 18,
                              ),
                              Positioned(
                                top: MediaQuery.sizeOf(context).height * .20,
                                left: MediaQuery.sizeOf(context).width / 20,
                                right: MediaQuery.sizeOf(context).width / 20,
                                child: SvgPicture.asset(
                                  "${content[item]['imgPath']}",
                                  width: MediaQuery.sizeOf(context).width * .7,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      colors: [
                                        AppColors
                                            .primaryColor, // Start color at the bottom
                                        Colors.white, // End color at the top
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${content[item]['title']}",
                                        style: AppStyles
                                            .primaryColorTextW600Size24,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18.0),
                                        child: Text(
                                          "${content[item]['subTitle']}",
                                          style: AppStyles.greyTextW600Size18,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              content.length,
                                              (index) =>
                                                  buildDot(index, context))),
                                      const SizedBox(height: 10),
                                      if (currentIndex ==
                                          content.length - 1) ...[
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: PrimaryButton(
                                            title: AppStrings.letsStart,
                                            onPressed: () {
                                              Get.offAll(
                                                  () => const AppLayout());
                                            },
                                            buttonColor: AppColors.primaryColor,
                                            titleColor: AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                      if (currentIndex == 0) ...[
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: PrimaryButton(
                                            title: AppStrings.next,
                                            onPressed: () {
                                              _controller.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.bounceIn);
                                            },
                                            buttonColor: AppColors.primaryColor,
                                            titleColor: AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                      if (currentIndex != content.length - 1 &&
                                          currentIndex != 0)
                                        Row(
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _controller.previousPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        curve: Curves.bounceIn);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.arrow_back,
                                                        color: AppColors
                                                            .primaryColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Text(AppStrings.back,
                                                          style: AppStyles
                                                              .primaryColorTextW600Size16)
                                                    ],
                                                  ),
                                                )
                                                // PrimaryButton(
                                                //   title: AppStrings.skip,
                                                //   onPressed: () {
                                                //     _controller.previousPage(
                                                //         duration: const Duration(
                                                //             milliseconds: 100),
                                                //         curve: Curves.bounceIn);
                                                //   },
                                                //   buttonColor: AppColors.white,
                                                //   titleColor:
                                                //       AppColors.purplePrimary,
                                                //   isWithBorder: true,
                                                //   isWhite: true,
                                                //   // isWithBorder: true,
                                                // ),
                                                ),
                                            //const SizedBox(width: 10,),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: PrimaryButton(
                                                    title: AppStrings.next,
                                                    onPressed: () {
                                                      if (currentIndex !=
                                                          content.length - 1) {
                                                        _controller.nextPage(
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        100),
                                                            curve: Curves
                                                                .bounceIn);
                                                      } else {
                                                        Get.offAll(() =>
                                                            const AppLayout());
                                                      }
                                                    },
                                                    buttonColor:
                                                        AppColors.primaryColor,
                                                    titleColor:
                                                        AppColors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index
              ? AppColors.secondaryColor
              : AppColors.primaryColor),
    );
  }
}
