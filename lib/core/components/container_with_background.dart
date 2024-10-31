import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';

class ContainerWithBackground extends StatelessWidget {
  const ContainerWithBackground({super.key, required this.icon});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
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