import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/primary_button.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/screens/help_and_support_first_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productData});
  final ProductData productData;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Map<String, bool> likedProducts = {};

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllProducts();

    // Initialize the liked status for the product
    likedProducts[widget.productData.productId!] =
        BlocProvider.of<HomeCubit>(context)
            .favoriteItems
            .contains(widget.productData.productId);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBarTitle: "${widget.productData.brand}",
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          final productId = widget.productData.productId!;
          int quantity = homeCubit.getQuantity(productId);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  widget.productData.images != null
                      ? Image.network(
                          widget.productData.images![0].sizes![0].url!,
                          height: MediaQuery.sizeOf(context).height * .4,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                      : Container(height: 100, color: Colors.grey[300]),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.productData.brand}",
                        style: AppStyles.primaryColorTextW600Size20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Toggle the like status and update the UI
                          setState(() {
                            bool isLiked =
                                likedProducts[widget.productData.productId!] ??
                                    false;
                            likedProducts[widget.productData.productId!] =
                                !isLiked;

                            if (likedProducts[widget.productData.productId]!) {
                              homeCubit.addToFavorites(widget.productData);
                            } else {
                              homeCubit.removeFromFavorites(widget.productData);
                            }
                          });
                        },
                        child: Icon(
                          likedProducts[widget.productData.productId] ?? false
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  if (widget.productData.categories?[0] != null)
                    Row(
                      children: [
                        Text(
                          "Category : ${widget.productData.categories?[0] ?? ""}",
                          style: AppStyles.greyTextW600Size18,
                        )
                      ],
                    ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "${widget.productData.description}",
                          style: AppStyles.greyTextW600Size18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          homeCubit
                              .decrementQuantity(widget.productData.productId!);
                          setState(() {}); // Update UI
                        },
                      ),
                      // Quantity Display
                      Text(
                        '${homeCubit.getQuantity(widget.productData.productId!)}',
                        style: AppStyles.primaryColorTextW600Size20,
                      ),
                      // Increment Button
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          homeCubit
                              .incrementQuantity(widget.productData.productId!);
                          setState(() {}); // Update UI
                        },
                      ),
                      PrimaryButton(
                        title: AppStrings.addToCart,
                        onPressed: () {
                          homeCubit.addToCart(widget.productData);
                        },
                        width: 160,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.fire_truck_outlined,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 40,
                        width: 2,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                          child: Text(
                        "Orders usually take from 2 - 3 hours of delivery",
                        style: AppStyles.primaryColorTextW500Size16,
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 40,
                        width: 2,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                          child: Text(
                        "You can pay cash or visa",
                        style: AppStyles.primaryColorTextW500Size16,
                      ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.help_center_outlined,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 40,
                        width: 2,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reach out if there's a problem",
                            style: AppStyles.primaryColorTextW500Size16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const HelpAndSupportFirstScreen());
                            },
                            child: Text(
                              "Help & Support",
                              style: AppStyles
                                  .primaryColorTextW500Size16Underlined,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
