import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horeca_smart/core/helper/api_services.dart';
import 'package:horeca_smart/features/home/data/product_data_model.dart';
import 'dart:convert';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductData> favoriteItems = [];
  List<ProductData> cartItems = [];
  
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


  // Add an item to favorites
  void addToFavorites(ProductData product) {
    if (!favoriteItems.contains(product)) {
      favoriteItems.add(product);
      emit(FavoritesUpdatedState());
    }
  }

  // Remove an item from favorites
  void removeFromFavorites(ProductData product) {
    favoriteItems.remove(product);
    emit(FavoritesUpdatedState());
  }

  // Get all favorite items
  List<ProductData> getFavoriteItems() {
    return favoriteItems;
  }

  // Add an item to the cart
  void addToCart(ProductData product) {
    if (!cartItems.contains(product)) {
      cartItems.add(product);
      emit(CartUpdatedState());
    }
  }

  // Remove an item from the cart
  void removeFromCart(ProductData product) {
    cartItems.remove(product);
    emit(CartUpdatedState());
  }

  // Get all cart items
  List<ProductData> getCartItems() {
    return cartItems;
  }
}
