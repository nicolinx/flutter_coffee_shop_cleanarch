import 'package:flutter_coffee_shop_cleanarch/features/catalog/models/coffee_model.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<CoffeeModel> coffees;
  CatalogLoaded(this.coffees);
}

class CatalogError extends CatalogState {
  final String message;
  CatalogError(this.message);
}
