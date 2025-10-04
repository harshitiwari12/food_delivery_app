import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_event.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_state.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial || (state is CartUpdated && state.items.isEmpty)) {
            return const Center(child: Text("Your cart is empty"));
          }
          final items = state is CartUpdated ? state.items : [];
          final total = items.fold<double>(0, (sum, item) => sum + item.price);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text("₹${item.price}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<CartBloc>().add(RemoveItem(item));
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text("Place Order (₹$total)"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderConfirmationScreen()));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
