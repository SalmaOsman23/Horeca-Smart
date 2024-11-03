import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/components/custom_search_form_field.dart';
import 'package:horeca_smart/core/layouts/screen_layout.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productData});
  final ProductData productData;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
        appBarTitle: AppStrings.ourProducts,
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit homeCubit = HomeCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  
                ],
              ),
            );
          },
        ));
  }
}
