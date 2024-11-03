import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';

class ProductCardInFavoritesScreen extends StatelessWidget {
  const ProductCardInFavoritesScreen(
      {super.key,
      required this.productData,
      this.onDeleteTapped,
      this.onCartTapped});
  final ProductData productData;
  final void Function()? onDeleteTapped;
  final void Function()? onCartTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          productData.images != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    productData.images![0].sizes![0].url!,
                    width: MediaQuery.sizeOf(context).width * .1,
                    height: MediaQuery.sizeOf(context).width * .2,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(height: 100, color: Colors.grey[300]),
              const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${productData.brand}",
                  style: AppStyles.primaryColorTextW600Size18,
                ),
                Text(
                  "${productData.description}",
                  style: AppStyles.primaryColorTextW500Size14,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: onDeleteTapped,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColors.white,
                    )),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onCartTapped,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: AppColors.white,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
