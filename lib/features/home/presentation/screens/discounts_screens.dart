import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/loading_widget.dart';
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
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return state is GetAllProductsLoadingState
            ? const LoadingWidget()
            : SingleChildScrollView(
              child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        homeCubit.productDataModel?.data?.length ??
                            0, // Iterate over all product data
                        (index) {
                          // Get the product data
                          final product =
                              homeCubit.productDataModel?.data?[index];
              
                          if (product == null) {
                            return Container(); // Return empty container if product is null
                          }
              
                          // Assuming the fields in your product model are `name`, `imageUrl`, `price`, and `category`
                          return 
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display product name
                                Text(
                                  product.description ?? "Product Name",
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
              
                                // Display product image
                                product.images != null
                                    ? Image.network(
                                        product.images![0].sizes![0].url!,
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        height: 100, color: Colors.grey[300]),
              
                                const SizedBox(height: 8),
                                // Display product category
                                Text(
                                  "Category: ${product.categories?[0] ?? 'Unknown'}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Column(
                    //   children: List.generate(
                    //     homeCubit.productDataModel?.data?.length ?? 0,
                    //     (index) => Container(
                    //         margin: const EdgeInsets.symmetric(vertical: 5),
                    //         child: Text(
                    //           "${homeCubit.productDataModel?.data?[index].itemInformation}",
                    //         )),
                    //   ),
                    // )
                  ],
                ),
            );
      },
    );
  }
}
