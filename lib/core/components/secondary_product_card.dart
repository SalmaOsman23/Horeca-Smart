import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';

class SecondaryProductCard extends StatefulWidget {
  const SecondaryProductCard(
      {super.key,
      required this.productData,
      this.onLikeTapped,
      this.isLiked = false,
      this.onAddToCartPressed});
  final ProductData productData;
  final void Function()? onLikeTapped;
  final void Function()? onAddToCartPressed;
  final bool isLiked;

  @override
  State<SecondaryProductCard> createState() => _SecondaryProductCardState();
}

class _SecondaryProductCardState extends State<SecondaryProductCard> {
  bool _isLiked = false;
  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                  widget.onLikeTapped?.call();
                },
                child: Icon(
                  _isLiked
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: AppColors.primaryColor,
                ),
              )),
          Column(
            children: [
              widget.productData.images != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.productData.images![0].sizes![0].url!,
                        width: MediaQuery.sizeOf(context).width * .2,
                        height: MediaQuery.sizeOf(context).width * .3,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(height: 100, color: Colors.grey[300]),
              const SizedBox(height: 8),
              Text(
                "${widget.productData.brand}",
                style: AppStyles.primaryColorTextW600Size18,
              ),
              const SizedBox(height: 8),
              Text(
                "${widget.productData.categories?[0]}",
                style: AppStyles.primaryColorTextW600Size16,
              ),
              const SizedBox(height: 8),
              SecondaryButton(
                title: AppStrings.addToCart,
                onPressed: widget.onAddToCartPressed,
                isWhite: true,
                isWithBorder: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
