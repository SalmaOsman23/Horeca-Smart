import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:horeca_smart/core/components/custom_form_field.dart';
import 'package:horeca_smart/core/components/custom_search_form_field.dart';
import 'package:horeca_smart/core/components/loading_widget.dart';
import 'package:horeca_smart/core/components/primary_product_card.dart';
import 'package:horeca_smart/core/components/title_with_view_all_widget.dart';
import 'package:horeca_smart/core/enums/show_toast.dart';
import 'package:horeca_smart/core/utils/app_assets.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';
import 'package:horeca_smart/features/home/presentation/components/announcement_widget.dart';
import 'package:horeca_smart/features/home/presentation/components/new_arrivals_widget.dart';
import 'package:horeca_smart/features/home/presentation/screens/main_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> announcementBannerData = [
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "thththdsd",
        "text": ""
      },
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "dfdfdfdf",
        "text": ""
      },
      {
        "imagePath": AppAssets.mobileWithCartIllustration,
        "title": "",
        "text": ""
      },
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return state is GetAllProductsLoadingState
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    AnnouncementsWidget(listOfData: announcementBannerData),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          //! Our Products
                          TitleWithViewAllWidget(
                            title: AppStrings.ourProducts,
                            onViewAllTap: () =>
                                Get.to(() => const MainProductsScreen()),
                          ),
                          Column(
                            children: List.generate(
                              5,
                              (index) {
                                // Get the product data
                                final product =
                                    homeCubit.productDataModel?.data?[index];

                                if (product == null) {
                                  return Container(); // Return empty container if product is null
                                }

                                // Assuming the fields in your product model are `name`, `imageUrl`, `price`, and `category`
                                return PrimaryProductCard(
                                  productData: product,
                                  onCartTapped: () {
                                    homeCubit.addToCart(product);
                                    showToast(message: AppStrings.addedToCart, state: ToastStates.success);
                                  },
                                );
                              },
                            ),
                          ),
                          //! Best Sellers Products
                          TitleWithViewAllWidget(
                            title: AppStrings.bestSellers,
                            onViewAllTap: () {},
                          ),
                          //! New Arrivals Products
                          TitleWithViewAllWidget(
                            title: AppStrings.newArrivals,
                            onViewAllTap: () {},
                          ),
                          const SizedBox(height: 10),
                          const NewArrivalsWidget(),
                          // //! Special Products
                          // TitleWithViewAllWidget(
                          //   title: AppStrings.specialProducts,
                          //   onViewAllTap: () {},
                          // ),
                          //! Brands
                          TitleWithViewAllWidget(
                            title: AppStrings.shopByBrand,
                            onViewAllTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
