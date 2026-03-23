import 'package:flutter_coffee_shop_cleanarch/core/network/dummy_api_client.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/models/coffee_model.dart';

class CoffeeRepository {
  final DummyApiClient _apiClient;

  CoffeeRepository(this._apiClient);

  Future<List<CoffeeModel>> getCoffees() async {
    try {
      // 1. Fetch raw JSON from the dummy API
      final rawData = await _apiClient.fetchCoffees();

      // 2. Map directly to our Freezed model
      return rawData.map((json) => CoffeeModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch coffees');
    }
  }
}
