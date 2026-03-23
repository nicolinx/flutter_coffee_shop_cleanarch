import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  runApp(
    // 3. Provide the Repository so Blocs can access it
    RepositoryProvider.value(
      value: coffeeRepository,
      child: const CoffeeShopApp(),
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
      home: BlocProvider(
        // 4. Create the Bloc and immediately trigger the fetch event
        create: (context) =>
            CatalogBloc(context.read<CoffeeRepository>())
              ..add(FetchCatalogStarted()),
        child: const CatalogScreen(),
      ),
    );
  }
}
