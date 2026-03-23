class DummyApiClient {
  Future<List<Map<String, dynamic>>> fetchCoffees() async {
    await Future.delayed(const Duration(milliseconds: 1500));

    return [
      {
        "id": "1",
        "name": "Espresso",
        "description": "Strong and bold classic espresso.",
        "price": 3.50,
        "imageUrl": "https://example.com/espresso.jpg",
      },
      {
        "id": "2",
        "name": "Latte",
        "description": "Smooth espresso with steamed milk.",
        "price": 4.50,
        "imageUrl": "https://example.com/latte.jpg",
      },
      {
        "id": "3",
        "name": "Mocha",
        "description": "Espresso, steamed milk, and rich chocolate.",
        "price": 5.00,
        "imageUrl": "https://example.com/mocha.jpg",
      },
    ];
  }
}
