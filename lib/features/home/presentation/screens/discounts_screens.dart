import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/loading_widget.dart';
import 'package:horeca_smart/core/components/primary_product_card.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class DiscountsScreens extends StatefulWidget {
  const DiscountsScreens({super.key});

  @override
  State<DiscountsScreens> createState() => _DiscountsScreensState();
}

class _DiscountsScreensState extends State<DiscountsScreens> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return state is GetAllProductsLoadingState
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(AppStrings.doNotMissOurDiscounts,style: AppStyles.primaryColorTextW600Size18,),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: List.generate(
                              homeCubit.productDataModel?.data?.length ?? 0,
                              (index) {
                                // Get the product data
                                final product =
                                    homeCubit.productDataModel?.data?[index];

                                if (product == null) {
                                  return Container(); // Return empty container if product is null
                                }
                                return PrimaryProductCard(
                                  productData: product,
                                  onCartTapped: () {
                                    homeCubit.addToCart(product);
                                  },
                                );
                              },
                            ),
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
