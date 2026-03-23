import 'package:flutter_coffee_shop_cleanarch/core/network/dummy_api_client.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/repository/coffee_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 1. Mock the low-level client directly
class MockApiClient extends Mock implements DummyApiClient {}

void main() {
  late CoffeeRepository repository;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    repository = CoffeeRepository(mockApiClient);
  });

  test(
    'should return a list of CoffeeModels when API call is successful',
    () async {
      // Arrange: Define what the mock should return
      final mockJson = [
        {
          "id": "1",
          "name": "Espresso",
          "price": 3.5,
          "description": "...",
          "imageUrl": "...",
        },
      ];
      when(
        () => mockApiClient.fetchCoffees(),
      ).thenAnswer((_) async => mockJson);

      // Act: Call the repository method
      final result = await repository.getCoffees();

      // Assert: Verify the data was mapped correctly
      expect(result.length, 1);
      expect(result.first.name, "Espresso");
      verify(() => mockApiClient.fetchCoffees()).called(1);
    },
  );
}
