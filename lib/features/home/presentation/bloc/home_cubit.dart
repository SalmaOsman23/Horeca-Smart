import 'dart:developer';

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
  Map<String, int> productQuantities = {}; //to track quantity of products

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

  Future<void> searchProduct({
    required String search,
  }) async {
    emit(GetSpecificProductsLoadingState());
    productDataModel = null;

    try {
      // Get the response from the API
      final response = await ApiService.getSpecificProducts(query: search);

      // Access statusCode and data from the response map
      final statusCode = response['statusCode'];
      final data = response['data'];

      // Check the status code and handle accordingly
      if (statusCode == 200 || statusCode == 201 || statusCode == 202) {
        // Construct the ProductDataModel from the response data
        productDataModel = ProductDataModel.fromJson(data);

        // Emit success state based on condition

        emit(GetSpecificProductsSuccessState());
        log("Success");
      } else if (statusCode == 422) {
        emit(GetSpecificProductsErrorState());
      } else {
        emit(GetSpecificProductsErrorState());
        print('Unexpected error: $statusCode');
      }
    } catch (error) {
      emit(GetSpecificProductsErrorState());
      print('Error: $error');
    }
  }

  // Add an item to favorites
  void addToFavorites(ProductData product) {
    if (!favoriteItems.contains(product)) {
      favoriteItems.add(product);
      log(" Favorites : ${favoriteItems.length}");
      emit(FavoritesUpdatedState());
    }
  }

  // Remove an item from favorites
  void removeFromFavorites(ProductData product) {
    favoriteItems.remove(product);
    log(" Favorites : ${favoriteItems.length}");
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
      log("Added to cart : ${cartItems.length}");
      emit(CartUpdatedState());
    }
  }

  // Remove an item from the cart
  void removeFromCart(ProductData product) {
    cartItems.remove(product);
    log("Added to cart : ${cartItems.length}");
    emit(CartUpdatedState());
  }

  // Get all cart items
  List<ProductData> getCartItems() {
    return cartItems;
  }

    // Method to increment quantity
  void incrementQuantity(String productId) {
    productQuantities[productId] = (productQuantities[productId] ?? 0) + 1;
    emit(CartUpdatedState());
  }

  // Method to decrement quantity
  void decrementQuantity(String productId) {
    if (productQuantities[productId] != null && productQuantities[productId]! > 1) {
      productQuantities[productId] = productQuantities[productId]! - 1;
      emit(CartUpdatedState());
    }
  }

  int getQuantity(String productId) {
    return productQuantities[productId] ?? 1; // Default to 1 if not set
  }
}
