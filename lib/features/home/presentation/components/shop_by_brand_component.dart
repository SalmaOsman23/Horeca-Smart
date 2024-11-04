import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/utils/app_colors.dart';
import 'package:horeca_smart/core/utils/app_strings.dart';
import 'package:horeca_smart/core/utils/app_styles.dart';
import 'package:horeca_smart/features/home/presentation/bloc/home_cubit.dart';

class ShopByBrandComponent extends StatefulWidget {
  const ShopByBrandComponent({super.key});

  @override
  State<ShopByBrandComponent> createState() => _ShopByBrandComponentState();
}

class _ShopByBrandComponentState extends State<ShopByBrandComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "fdhfhdfghghsds",
                  style: AppStyles.primaryColorTextW600Size12,
                ),
              ),
              const SizedBox(height: 20),
              // TODO: Contiue this tomorrow
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: homeCubit.productDataModel?.data?[0].brand?.map((item) {
              //       return SmallPlayerWidget(listOfData: item);
              //     }).toList(),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}

class SmallPlayerWidget extends StatelessWidget {
  const SmallPlayerWidget({super.key, required this.listOfData});
  final Map<String, dynamic> listOfData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listOfData['name'],
                style: AppStyles.primaryColorTextW600Size14,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const SizedBox(width: 4),
                  Text(
                    "( ${listOfData['rating_number']} )",
                    style: AppStyles.primaryColorTextW600Size12,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
