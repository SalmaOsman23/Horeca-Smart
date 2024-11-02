import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/helper/api_services.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'dart:convert';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  ProductDataModel? productDataModel;
  ProductData? productData;
  Future<void> getAllProducts() async {
    emit(GetAllProductsLoadingState());
    final response = await ApiService.getAllProducts();
    if (response != null) {
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        productDataModel =
            ProductDataModel.fromJson(json.decode(response.body));
        emit(GetAllProductsSuccessState());
      } else if (response.statusCode == 422) {
        emit(GetAllProductsErrorState());
      } else {
        emit(GetAllProductsErrorState());
        print('Unexpected error: ${response.statusCode}');
      }
    } else {
      // Handle null response (e.g., network error)
      emit(GetAllProductsErrorState());
      print('Error: Failed to retrieve products.');
    }
  }
}
