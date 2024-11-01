import 'package:flutter/material.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';

class MainProductsScreen extends StatelessWidget {
  const MainProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        appBarTitle: AppStrings.products,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [],
            ),
          ),
        ));
  }
}
