import 'package:flutter/material.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';

class NewArrivalsWidget extends StatefulWidget {
  const NewArrivalsWidget({super.key});

  @override
  State<NewArrivalsWidget> createState() => _NewArrivalsWidgetState();
}

class _NewArrivalsWidgetState extends State<NewArrivalsWidget>
    with SingleTickerProviderStateMixin {
  bool showFullData = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "sdsdsdsdsdsd",
                        style: AppStyles.primaryColorTextW500Size16,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 5),
                          Text("(2.00)",
                              style: AppStyles.primaryColorTextW500Size16),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  listItemIcon(
                    icon: const Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                  listItemIcon(
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                  ),
                  listItemIcon(
                    onTap: () {
                      setState(() {
                        showFullData = !showFullData;
                      });
                    },
                    icon: Icon(
                      showFullData
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                    ),
                  ),
                ],
              )
            ],
          ),

          /* ----------------- AnimatedSize to animate the visibility ----------------- */
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: showFullData
                  ? [
                      const SizedBox(height: 15),
                      buildRoleWidget(title: "sdsdd", subTitle: "Admin"),
                      buildRoleWidget(title: "dfdf", subTitle: "Midfield"),
                    ]
                  : [],
            ),
          ),
        ],
      ),
    );
  }

  Row buildRoleWidget({required String title, required String subTitle}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$title: ", style: AppStyles.primaryColorTextW600Size12),
        Text(subTitle, style: AppStyles.primaryColorTextW600Size12),
      ],
    );
  }

  GestureDetector listItemIcon({required Widget icon, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
