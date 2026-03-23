import 'package:flutter_coffee_shop_cleanarch/core/local_db/shared_prefs_helper.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/models/coffee_model.dart';

class CartRepository {
  final SharedPrefsHelper _prefsHelper;

  CartRepository(this._prefsHelper);

  Future<List<CoffeeModel>> getCartItems() async {
    final rawItems = await _prefsHelper.getCart();
    return rawItems.map((item) => CoffeeModel.fromJson(item)).toList();
  }

  Future<void> addToCart(CoffeeModel coffee) async {
    final currentItems = await _prefsHelper.getCart();
    currentItems.add(coffee.toJson()); // Model -> Map
    await _prefsHelper.saveCart(currentItems);
  }

  Future<void> clearCart() async {
    await _prefsHelper.saveCart([]);
  }
}
