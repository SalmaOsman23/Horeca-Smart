import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.emptyCartIllustration),
            const SizedBox(height: 20),
            Text(
              AppStrings.yourCartIsEmpty,
              style: AppStyles.primaryColorTextW600Size20,
            )
          ],
        ),
      ),
    );
  }
}
