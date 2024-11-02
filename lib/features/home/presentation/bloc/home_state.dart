part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllProductsLoadingState extends HomeState {}

class GetAllProductsSuccessState extends HomeState {}

class GetAllProductsErrorState extends HomeState {}
