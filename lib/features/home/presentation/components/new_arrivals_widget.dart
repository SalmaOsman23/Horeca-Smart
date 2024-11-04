import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'package:horeca_smart/features/home/presentation/screens/product_details_screen.dart';

class NewArrivalsWidget extends StatefulWidget {
  const NewArrivalsWidget(
      {super.key,
      required this.productData,
      this.onLikeTapped,
      required this.isLiked});
  final ProductData productData;
  final void Function()? onLikeTapped;
  final bool isLiked;

  @override
  State<NewArrivalsWidget> createState() => _NewArrivalsWidgetState();
}

class _NewArrivalsWidgetState extends State<NewArrivalsWidget>
    with SingleTickerProviderStateMixin {
  bool showFullData = false;
  bool _isLiked = false;
  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(productData: widget.productData));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    widget.productData.images != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.productData.images![0].sizes![0].url!,
                              width: MediaQuery.sizeOf(context).width * .2,
                              height: MediaQuery.sizeOf(context).width * .1,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(height: 100, color: Colors.grey[300]),
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${widget.productData.brand}",
                          style: AppStyles.primaryColorTextW600Size16,
                        ),
                        Row(
                          children: [
                            Text("${widget.productData.categories?[0]}",
                                style: AppStyles.primaryColorTextW500Size16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                        widget.onLikeTapped?.call();
                      },
                      child: listItemIcon(
                        icon: Icon(
                          _isLiked
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: AppColors.primaryColor,
                        ),
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
                        buildRoleWidget(
                            title: "Arrived", subTitle: "yesterday"),
                        const SizedBox(height: 8),
                        buildRoleWidget(
                            title: "Description",
                            subTitle: "${widget.productData.description}"),
                      ]
                    : [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRoleWidget({required String title, required String subTitle}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Text(
          "$title : ",
          style: AppStyles.primaryColorTextW600Size12,
        )),
        Flexible(
            child: Text(subTitle, style: AppStyles.primaryColorTextW600Size12)),
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
          color: AppColors.secondaryColor,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
