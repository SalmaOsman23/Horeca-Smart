import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class EmptyFavoriteWidget extends StatelessWidget {
  const EmptyFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.emptyFavoriteIllustration),
              const SizedBox(height: 20),
              Text(
                AppStrings.thereIsNoFavoriteProducts,
                style: AppStyles.primaryColorTextW600Size20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
