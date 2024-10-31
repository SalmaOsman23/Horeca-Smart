import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 1,
      leading: Container(
        margin: const EdgeInsets.only(left: 6),
        child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: appBarIcon(
                icon: const Icon(
              Icons.menu_rounded,
              color: AppColors.primaryColor,
            ))),
      ),
      actions: [
        appBarIcon(
            icon: const Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.white,
        )),
      ],
      iconTheme: const IconThemeData(),
      title: Text(
        currentIndex == 0
            ? AppStrings.home
            : currentIndex == 1
                ? AppStrings.cart
                : currentIndex == 2
                    ? AppStrings.favorites
                    : AppStrings.discounts,
        style: AppStyles.primaryColorTextW600Size18,
      ),
    );
  }

  Container appBarIcon({required Widget icon}) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
