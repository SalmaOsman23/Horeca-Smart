import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horeca_smart/features/home/presentation/components/app_bar_widget.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/presentation/components/app_drawer.dart';
import 'package:horeca_smart/features/home/presentation/screens/cart_screen.dart';
import 'package:horeca_smart/features/home/presentation/screens/discounts_screens.dart';
import 'package:horeca_smart/features/home/presentation/screens/favorite_screen.dart';
import 'package:horeca_smart/features/home/presentation/screens/home_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const DiscountsScreens()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
      appBar: AppBarWidget(currentIndex: _currentIndex),
      drawer: const AppDrawer(),
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        items: [
          CurvedNavigationBarItem(
            child: _buildNavItem(
              icon: _currentIndex == 0
                  ? const Icon(
                      Icons.home_outlined,
                      color: AppColors.white,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: AppColors.primaryColor,
                    ),
              label: AppStrings.home,
              isSelected: _currentIndex == 0,
            ),
          ),
          CurvedNavigationBarItem(
            child: _buildNavItem(
              icon: _currentIndex == 1
                  ? const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.white,
                    )
                  : const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryColor,
                    ),
              label: AppStrings.cart,
              isSelected: _currentIndex == 1,
            ),
          ),
          CurvedNavigationBarItem(
            child: _buildNavItem(
              icon: _currentIndex == 2
                  ? const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.white,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColors.primaryColor,
                    ),
              label: AppStrings.favorites,
              isSelected: _currentIndex == 2,
            ),
          ),
          CurvedNavigationBarItem(
            child: _buildNavItem(
              icon: _currentIndex == 3
                  ? const Icon(
                      Icons.percent,
                      color: AppColors.white,
                    )
                  : const Icon(
                      Icons.percent,
                      color: AppColors.primaryColor,
                    ),
              label: AppStrings.discounts,
              isSelected: _currentIndex == 3,
            ),
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: AppColors.primaryColor,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    ));
  }
}

Widget _buildNavItem(
    {required Widget icon, required String label, required bool isSelected}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Positioned(
              bottom: -10, // Adjust the position as needed
              child: CustomPaint(
                painter: CurvedIndicatorPainter(),
                child: const SizedBox(
                  width: 60,
                  height: 20,
                ),
              ),
            ),
          icon,
        ],
      ),
      if (!isSelected)
        Text(label,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: GoogleFonts.poppins().fontFamily)),
    ],
  );
}

class CurvedIndicatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2,
        0,
        size.width,
        size.height,
      )
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
