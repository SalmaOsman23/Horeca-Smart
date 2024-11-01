import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/custom_search_form_field.dart';
import 'package:horeca_smart/core/components/product_primary_card.dart';
import 'package:horeca_smart/core/components/title_with_view_all_widget.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/presentation/components/announcement_widget.dart';
import 'package:horeca_smart/features/home/presentation/screens/main_products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> announcementBannerData = [
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "thththdsd",
        "text": ""
      },
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "dfdfdfdf",
        "text": ""
      },
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "",
        "text": ""
      },
    ];
    TextEditingController controller = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        children: [
          AnnouncementsWidget(listOfData: announcementBannerData),
          const SizedBox(height: 10),
          //! Display Regular Product
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TitleWithViewAllWidget(
                  title: AppStrings.ourProducts,
                  onViewAllTap: () => Get.to(() => const MainProductsScreen()),
                ),
                Column(
                  children: List.generate(5, (index) {
                    return ProductPrimaryCard(
                      onProductTap: () {},
                    );
                  }),
                ),
                CustomFormField(label: "label", isMandatory: true),
                CustomSearchFormField(controller: controller)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
