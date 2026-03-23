import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/core/local_db/shared_prefs_helper.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/bloc/cart_event.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/repository/cart_repository.dart';
import 'core/network/dummy_api_client.dart';
import 'features/catalog/bloc/catalog_bloc.dart';
import 'features/catalog/bloc/catalog_event.dart';
import 'features/catalog/repository/coffee_repository.dart';
import 'features/catalog/ui/catalog_screen.dart';

void main() {
  // 1. Initialize our low-level data providers
  final apiClient = DummyApiClient();

  // 2. Inject them into our repositories
  final coffeeRepository = CoffeeRepository(apiClient);

  final sharedPrefsHelper = SharedPrefsHelper();
  final cartRepository = CartRepository(sharedPrefsHelper);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: coffeeRepository),
        RepositoryProvider.value(value: cartRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CatalogBloc(context.read<CoffeeRepository>())
                  ..add(FetchCatalogStarted()),
          ),
          BlocProvider(
            create: (context) =>
                CartBloc(context.read<CartRepository>())
                  ..add(LoadCartStarted()),
          ),
        ],
        child: const CoffeeShopApp(),
      ),
    ),
  );
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown, useMaterial3: true),
      home: CatalogScreen(),
    );
  }
}
