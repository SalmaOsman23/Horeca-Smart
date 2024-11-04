import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/screens/product_details_screen.dart';

class PrimaryProductCard extends StatelessWidget {
  const PrimaryProductCard({
    super.key,
    required this.productData, this.onCartTapped,
  });
  final ProductData productData;
  final void Function()? onCartTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productData: productData));
      },
      child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryLighterColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Column(children: [
                // Product image with placeholder
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: productData.images != null
                      ? Image.network(
                          productData.images![0].sizes![0].url!,
                          width: MediaQuery.sizeOf(context).width * .2,
                          height: MediaQuery.sizeOf(context).width * .3,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: MediaQuery.sizeOf(context).width * .2,
                          height: MediaQuery.sizeOf(context).width * .3,
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[600],
                            size: 48,
                          ),
                        ),
                ),
              ]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  children: [
                    // Product details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${productData.brand}",
                              style: AppStyles.primaryColorTextW600Size18,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.secondaryColor,
                              ),
                              child: Text(
                                "\$25", // Consider using `productData.price` if it’s available
                                style: AppStyles.primaryColorTextW600Size14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${productData.description}",
                          style: AppStyles.primaryColorTextW500Size14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              "${AppStrings.category} : ",
                              style: AppStyles.primaryColorTextW600Size16,
                            ),
                            Text(
                              "${productData.categories?[0]}",
                              style: AppStyles.primaryColorTextW600Size14,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SecondaryButton(
                              title: AppStrings.addToCart,
                              height: 35,
                              width: 100,
                              fontSize: 12,
                              isWhite: true,
                              isWithBorder: true,
                              onPressed: onCartTapped,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
