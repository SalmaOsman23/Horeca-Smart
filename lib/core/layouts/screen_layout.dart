import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class ScreenLayout extends StatefulWidget {
  final String appBarTitle;
  final Widget body;
  final Widget? action;
  final bool isLeadingNeeded;
  const ScreenLayout(
      {super.key,
      required this.appBarTitle,
      required this.body,
      this.action,
      this.isLeadingNeeded = true});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(widget.appBarTitle, style: AppStyles.primaryColorTextW600Size20),
        leading:
            //  widget.appBarTitle != AppStrings.createFamilyAccount
            //     ?
            //! To check if the leading arrow is needed or not
            widget.isLeadingNeeded
                ? GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      color: AppColors.primaryColor,
                      size: 34,
                    ),
                  )
                : null,
        actions: [
          if (widget.action != null) ...[widget.action!],
        ],
      ),
      body: GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: widget.body),
    );
  }
}
