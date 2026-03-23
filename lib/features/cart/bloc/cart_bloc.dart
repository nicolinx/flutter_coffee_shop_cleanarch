import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/repository/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _repository;

  CartBloc(this._repository) : super(CartInitial()) {
    // 1. Initial Load
    on<LoadCartStarted>((event, emit) async {
      emit(CartLoading());
      try {
        final items = await _repository.getCartItems();
        emit(CartLoaded(items));
      } catch (e) {
        emit(CartError("Could not load cart"));
      }
    });

    // 2. Add Item
    on<AddToCartPressed>((event, emit) async {
      try {
        await _repository.addToCart(event.coffee);
        final items = await _repository.getCartItems();
        emit(CartLoaded(items));
      } catch (e) {
        emit(CartError("Could not add to cart"));
      }
    });

    // 3. Clear Cart (Useful for after checkout)
    on<ClearCartPressed>((event, emit) async {
      try {
        await _repository.clearCart();
        emit(CartLoaded(const []));
      } catch (e) {
        emit(CartError("Could not clear cart"));
      }
    });
  }
}
