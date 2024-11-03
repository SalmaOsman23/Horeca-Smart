import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/custom_search_form_field.dart';
import 'package:horeca_smart/core/components/loading_widget.dart';
import 'package:horeca_smart/core/components/secondary_product_card.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class MainProductsScreen extends StatefulWidget {
  const MainProductsScreen({super.key});

  @override
  State<MainProductsScreen> createState() => _MainProductsScreenState();
}

class _MainProductsScreenState extends State<MainProductsScreen> {
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
            return state is GetAllProductsLoadingState
                ? const LoadingWidget()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CustomSearchFormField(controller: searchController),
                          const SizedBox(height: 10),
                          Column(
                            children: List.generate(ho
                              homeCubit.productDataModel?.data?.length ?? 0,
                              (index) {
                                // Get the product data
                                final product =
                                    homeCubit.productDataModel?.data?[index];

                                if (product == null) {
                                  return Container(); // Return empty container if product is null
                                }

                                // Assuming the fields in your product model are `name`, `imageUrl`, `price`, and `category`
                                return SecondaryProductCard(
                                  productData: product,
                                  // onProductTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
