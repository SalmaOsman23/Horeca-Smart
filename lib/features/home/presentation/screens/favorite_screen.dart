import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/empty_favorite_widget.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/components/product_card_in_favorites_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getFavoriteItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is FavoritesUpdatedState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return homeCubit.favoriteItems.isEmpty
            ? const EmptyFavoriteWidget()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Favorites ( ${homeCubit.favoriteItems.length} )",
                            style: AppStyles.primaryColorTextW600Size18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: List.generate(
                          homeCubit.favoriteItems.length,
                          (index) {
                            // Get the product data
                            final product =
                                homeCubit.favoriteItems[index];

                            if (product == null) {
                              return Container(); // Return empty container if product is null
                            }
                            final productId = product.productId;
                            // if(!likedProducts.containsKey(productId)){
                            //   likedProducts[productId!] = homeCubit.favoriteItems.contains(product);
                            // }
                            return ProductCardInFavoritesScreen(
                                productData: product,
                                 onDeleteTapped: () {
                                   homeCubit.removeFromFavorites(product);
                                   setState(() {
                                     
                                   });
                                 },
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
