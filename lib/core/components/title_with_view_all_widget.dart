import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class TitleWithViewAllWidget extends StatelessWidget {
  final String title;
  final void Function()? onViewAllTap;
  const TitleWithViewAllWidget({
    super.key,
    required this.title, this.onViewAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: AppStyles.primaryColorTextW600Size18,
        ),
        GestureDetector(
          onTap: onViewAllTap,
          child: Text(
            AppStrings.viewAll,
            style: AppStyles.secondaryColorTextW600Size14Underlined,
          ),
        ),
      ],
    );
  }
}