import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class ProductPrimaryCard extends StatelessWidget {
  const ProductPrimaryCard({super.key, this.onProductTap});
  final void Function()? onProductTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProductTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryLighterColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.womanDoingShoppingIllustration,
              width: MediaQuery.sizeOf(context).width / 5,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Name",
                    style: AppStyles.primaryColorTextW600Size16,
                  ),
                  Text(
                    "Product Name ghghgh hgsdsibds shhebjf djhsh jksogwsbbuuy kskjsbdj jsbd hd ujhjs  lia hhddhbfhbjndbf hfgu hfhg hdd ",
                    style: AppStyles.primaryColorTextW500Size14,
                    overflow: TextOverflow.ellipsis,
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
