import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    super.key,
    required this.title,
    required this.icon,
 
    this.onRowTapped,
  });
  final String title;
  final IconData icon;
  final void Function()? onRowTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRowTapped,
      child: Row(  
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon,color: AppColors.white,),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: AppStyles.primaryColorTextW600Size14,
          ),
          
        ],
      ),
    );
  }
}
