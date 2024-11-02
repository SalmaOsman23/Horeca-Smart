import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';

class ProductPrimaryCard extends StatelessWidget {
  const ProductPrimaryCard({
    super.key,
    this.onProductTap,
    required this.productData,
  });
  final void Function()? onProductTap;
  final ProductData productData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryLighterColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Display product image
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
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${productData.description}",
                    style: AppStyles.primaryColorTextW600Size16,
                  ),
                  Text(
                    "${productData.description}",
                    style: AppStyles.primaryColorTextW500Size14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text("${AppStrings.category} : ",style: AppStyles.primaryColorTextW600Size16,),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(
                          "${productData.categories?[0]}",
                          style: AppStyles.primaryColorTextW600Size14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "25 \$",
                    style: AppStyles.primaryColorTextW600Size12,
                  ),
                ),
                PrimaryButton(
                  title: AppStrings.addToCart,
                  height: 30,
                  fontSize: 12,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
