import 'package:flutter_coffee_shop_cleanarch/features/cart/repository/cart_repository.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/services/payment_service.dart';

class CheckoutManager {
  final CartRepository _cartRepository;
  final PaymentService _paymentService;

  CheckoutManager(this._cartRepository, this._paymentService);

  Future<void> checkout() async {
    // 1. Get the current cart items
    final items = await _cartRepository.getCartItems();
    if (items.isEmpty) throw Exception("Cart is empty");

    // 2. Calculate total
    final total = items.fold(0.0, (sum, item) => sum + item.price);

    // 3. Call the Payment Service
    final success = await _paymentService.processPayment(total);

    if (success) {
      // 4. If payment worked, clear the local cart
      await _cartRepository.clearCart();
    } else {
      throw Exception("Payment failed. Please try again.");
    }
  }
}
