import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/empty_cart_widget.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/components/product_card_in_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, bool> productsInCart = {};

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);

        return homeCubit.cartItems.isEmpty
            ? const EmptyCartWidget()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Cart ( ${homeCubit.cartItems.length} )",
                            style: AppStyles.primaryColorTextW600Size18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: List.generate(
                          homeCubit.cartItems.length,
                          (index) {
                            final product = homeCubit.cartItems[index];
                            final productId = product.productId;
                            if (product == null) {
                              return Container();
                            }

                            // Initialize liked status if not already set
                            if (!productsInCart.containsKey(productId)) {
                              productsInCart[productId!] =
                                  homeCubit.cartItems.contains(product);
                            }

                            return ProductCardInCartScreen(
                              productData: product,
                              onDeleteTapped: () {
                                homeCubit.removeFromCart(product);
                                setState(() {});
                              },
                              onLikeTapped: () {
                                setState(() {
                                  // Toggle liked status
                                  productsInCart[productId!] =
                                      !(productsInCart[productId] ?? false);

                                  // Add or remove from favorites based on liked status
                                  if (productsInCart[productId]!) {
                                    homeCubit.addToFavorites(product);
                                  } else {
                                    homeCubit.removeFromFavorites(product);
                                  }
                                });
                              },
                              isLiked: productsInCart[productId] ?? false,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
