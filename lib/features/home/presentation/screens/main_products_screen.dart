import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/custom_search_form_field.dart';
import 'package:horeca_smart/core/components/loading_widget.dart';
import 'package:horeca_smart/core/components/secondary_product_card.dart';
import 'package:horeca_smart/core/helper/api_services.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/screens/product_details_screen.dart';

class MainProductsScreen extends StatefulWidget {
  const MainProductsScreen({super.key});

  @override
  State<MainProductsScreen> createState() => _MainProductsScreenState();
}

class _MainProductsScreenState extends State<MainProductsScreen> {
  Map<String, bool> likedProducts = {}; // Using productId as the key
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      appBarTitle: AppStrings.products,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return state is GetAllProductsLoadingState ||
                  state is GetSpecificProductsLoadingState
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomSearchFormField(
                          controller: searchController,
                          onSubmitted: (value) {
                            homeCubit.searchProduct(search: value);
                          },
                        ),
                        const SizedBox(height: 10),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0, // Space between columns
                            childAspectRatio: 0.7, //
                          ),
                          itemCount:
                              homeCubit.productDataModel?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            // Get the product data
                            final product =
                                homeCubit.productDataModel?.data?[index];

                            if (product == null) {
                              return Container(); // Return empty container if product is null
                            }
                            final productId = product.productId;

                            if (!likedProducts.containsKey(productId)) {
                              likedProducts[productId!] =
                                  homeCubit.favoriteItems.contains(product);
                            }

                            return GestureDetector(
                              onTap: () {
                                Get.to(() =>
                                    ProductDetailsScreen(productData: product));
                              },
                              child: SecondaryProductCard(
                                productData: product,
                                onLikeTapped: () {
                                  setState(() {
                                    // Toggle liked status using productId
                                    likedProducts[productId!] =
                                        !(likedProducts[productId] ?? false);
                                  });

                                  if (likedProducts[productId]!) {
                                    homeCubit.addToFavorites(product);
                                  } else {
                                    homeCubit.removeFromFavorites(product);
                                  }
                                },
                                isLiked: likedProducts[productId] ?? false,
                              ),
                            );
                          },
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
