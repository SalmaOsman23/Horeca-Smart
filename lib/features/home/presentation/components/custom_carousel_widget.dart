import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class CustomCarouselWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String text;

  const CustomCarouselWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          SvgPicture.asset( 
            imagePath,
            width: MediaQuery.sizeOf(context).width / 4,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.whiteColorTextW600Size18,
                ),
                const SizedBox(height: 6.0),
                Flexible(
                  child: SizedBox(
                    width: 250,
                    child: Text(
                      text,
                      style: AppStyles.whiteColorTextW600Size14,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
