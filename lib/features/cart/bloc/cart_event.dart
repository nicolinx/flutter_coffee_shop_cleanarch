import 'package:flutter_coffee_shop_cleanarch/features/catalog/models/coffee_model.dart';

abstract class CartEvent {}

class LoadCartStarted extends CartEvent {}

class AddToCartPressed extends CartEvent {
  final CoffeeModel coffee;
  AddToCartPressed(this.coffee);
}

class ClearCartPressed extends CartEvent {}
