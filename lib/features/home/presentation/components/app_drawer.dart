import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:horeca_smart/core/components/container_with_background.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/auth/screens/sign_up_screen.dart';
import 'package:horeca_smart/features/home/presentation/components/drawer_row.dart';
import 'package:horeca_smart/features/home/presentation/screens/help_and_support_screen.dart';
import 'package:horeca_smart/features/home/presentation/screens/invitations_screen.dart';
import 'package:horeca_smart/features/home/presentation/screens/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * .10),
              Text(
                AppStrings.horecaSmart.toUpperCase(),
                style: AppStyles.primaryColorTextW600Size24,
              ),
              const SizedBox(height: 20),
              DrawerRow(
                title: AppStrings.settings,
                icon: Icons.settings_rounded,
                onRowTapped: () {
                  Navigator.pop(context);
                  setState(() {
                    Get.to(() => const SettingsScreen());
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerRow(
                title: AppStrings.policies,
                icon: Icons.policy_rounded,
                onRowTapped: () {},
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerRow(
                title: AppStrings.helpAndSupport,
                icon: Icons.help,
                onRowTapped: () {
                  Get.to(() => const HelpAndSupportScreen());
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 5,
              ),
              DrawerRow(
                title: AppStrings.invitations,
                icon: Icons.mobile_screen_share,
                onRowTapped: () {
                  Get.to(() => const InvitationsScreen());
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                title: AppStrings.signUp,
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccount,
                    style: AppStyles.primaryColorTextW600Size12,
                  ),
                  Text(
                    AppStrings.logIn,
                    style: AppStyles.primaryColorTextW600Size14Underlined,
                  )
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height / 12),
              Column(
                children: [
                  Text(
                    AppStrings.wannaKnowMoreAboutUs,
                    style: AppStyles.primaryColorTextW600Size16,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    AppStrings.followUsOn,
                    style: AppStyles.primaryColorTextW600Size14,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final Uri url = Uri.parse("https://www.facebook.com/horecasmartofficiall/");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("Could not launch URL");
                          }
                          // launchUrl(Uri.parse(
                          //     "https://www.facebook.com/horecasmartofficiall/"));
                        },
                        child: const ContainerWithBackground(
                          icon: Icon(
                            Icons.facebook,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () async {
                           final Uri url = Uri.parse("https://www.instagram.com/horecasmartofficial?igsh=OWpzZGphNjdjbHo5");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("Could not launch URL");
                          }
                          // launchUrl(Uri.parse(
                          //     "https://www.instagram.com/horecasmartofficial?igsh=OWpzZGphNjdjbHo5"));
                        },
                        child: ContainerWithBackground(
                            icon: SvgPicture.asset(
                          AppAssets.instagramIconSvg,
                          width: 23,
                        )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
