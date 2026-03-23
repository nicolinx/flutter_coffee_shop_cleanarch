import 'package:flutter_coffee_shop_cleanarch/features/catalog/models/coffee_model.dart';

abstract class CartState {
  final List<CoffeeModel> items;
  CartState({this.items = const []});
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  CartLoaded(List<CoffeeModel> items) : super(items: items);

  // Helper to calculate total price in the state
  double get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}
