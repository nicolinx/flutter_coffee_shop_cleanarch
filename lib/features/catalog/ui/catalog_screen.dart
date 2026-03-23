import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/bloc/catalog_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/catalog/bloc/catalog_state.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('☕ Coffee Menu')),
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is CatalogLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CatalogLoaded) {
            return ListView.builder(
              itemCount: state.coffees.length,
              itemBuilder: (context, index) {
                final coffee = state.coffees[index];
                return ListTile(
                  leading: const Icon(Icons.coffee_outlined),
                  title: Text(coffee.name),
                  subtitle: Text(coffee.description),
                  trailing: Text('\$${coffee.price.toStringAsFixed(2)}'),
                );
              },
            );
          }

          if (state is CatalogError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
