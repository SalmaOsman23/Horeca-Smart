import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';

class ProductCardInCartScreen extends StatefulWidget {
  const ProductCardInCartScreen(
      {super.key,
      required this.productData,
      this.onDeleteTapped,
      this.onLikeTapped,
      required this.isLiked});
  final ProductData productData;
  final bool isLiked;
  final void Function()? onDeleteTapped;
  final void Function()? onLikeTapped;

  @override
  State<ProductCardInCartScreen> createState() =>
      _ProductCardInCartScreenState();
}

class _ProductCardInCartScreenState extends State<ProductCardInCartScreen> {
  bool _isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          widget.productData.images != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.productData.images![0].sizes![0].url!,
                    width: MediaQuery.sizeOf(context).width * .1,
                    height: MediaQuery.sizeOf(context).width * .2,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(height: 100, color: Colors.grey[300]),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.productData.brand}",
                  style: AppStyles.primaryColorTextW600Size18,
                ),
                Text(
                  "${widget.productData.description}",
                  style: AppStyles.primaryColorTextW500Size14,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: widget.onDeleteTapped,
                child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColors.white,
                    )),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
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
              )
            ],
          )
        ],
      ),
    );
  }
}
