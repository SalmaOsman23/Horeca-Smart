import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/container_with_background.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/screens/cart_screen.dart';

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
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.only(left: 6),
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu_rounded,
            color: AppColors.primaryColor,
            size: 35,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(() => const ScreenLayout(
                  appBarTitle: AppStrings.cart,
                  body: CartScreen(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Stack(
              children: [
                const ContainerWithBackground(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.white,
                  ),
                ),
                Positioned(
                    bottom: 1,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration:  BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                          shape: BoxShape.circle, color: AppColors.white),
                      child: Text(
                        "${BlocProvider.of<HomeCubit>(context).cartItems.length}",
                        style: AppStyles.primaryColorTextW600Size12,
                      ),
                    )),
              ],
            ),
          ),
        ),
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
        style: AppStyles.primaryColorTextW600Size20,
      ),
    );
  }
}
