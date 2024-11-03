import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';

class SecondaryProductCard extends StatelessWidget {
  const SecondaryProductCard({super.key, required this.productData});
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          productData.images != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productData.images![0].sizes![0].url!,
                    width: MediaQuery.sizeOf(context).width * .2,
                    height: MediaQuery.sizeOf(context).width * .3,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(height: 100, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(
            "${productData.brand}",
            style: AppStyles.primaryColorTextW600Size18,
          ),
          const SizedBox(height: 8),
          Text(
            "${productData.categories?[0]}",
            style: AppStyles.primaryColorTextW600Size16,
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                FontAwesomeIcons.cartShopping,
                color: AppColors.primaryColor,
              ),
              Icon(
                FontAwesomeIcons.heart,
                color: AppColors.primaryColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
