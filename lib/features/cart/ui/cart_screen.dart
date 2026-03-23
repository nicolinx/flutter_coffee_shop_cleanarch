import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/bloc/cart_event.dart';
import 'package:flutter_coffee_shop_cleanarch/features/cart/bloc/cart_state.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/bloc/checkout_bloc.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/bloc/checkout_event.dart';
import 'package:flutter_coffee_shop_cleanarch/features/checkout/bloc/checkout_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      // Use BlocListener to handle navigation or dialogs when checkout finishes
      body: BlocListener<CheckoutBloc, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            // Refresh the cart UI since the Manager cleared the DB
            context.read<CartBloc>().add(LoadCartStarted());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Payment Successful! Cart Cleared.'),
              ),
            );
            Navigator.pop(context); // Go back to Catalog
          } else if (state is CheckoutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: Colors.red),
            );
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.items.isEmpty) {
              return const Center(child: Text('Your cart is empty ☕'));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        leading: const Icon(Icons.coffee),
                        title: Text(item.name),
                        trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                _CheckoutSection(state: state as CartLoaded),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CheckoutSection extends StatelessWidget {
  final CartLoaded state;
  const _CheckoutSection({required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${state.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, checkoutState) {
                final isLoading = checkoutState is CheckoutLoading;

                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () => context.read<CheckoutBloc>().add(
                            ConfirmPaymentPressed(),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Pay Now',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
