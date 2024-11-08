part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllProductsLoadingState extends HomeState {}

class GetAllProductsSuccessState extends HomeState {}

class GetAllProductsErrorState extends HomeState {}

class GetSpecificProductsLoadingState extends HomeState {}

class GetSpecificProductsSuccessState extends HomeState {}

class GetSpecificProductsErrorState extends HomeState {}

class FavoritesUpdatedState extends HomeState {}

class CartActionLoadingState extends HomeState {}

class CartUpdatedState extends HomeState {}

class CartActionErrorState extends HomeState {}

class CartCreatedState extends HomeState {}
