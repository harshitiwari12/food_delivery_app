import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocs/menu_bloc/menu_bloc.dart';
import '../../logic/blocs/menu_bloc/menu_event.dart';
import '../../logic/blocs/menu_bloc/menu_state.dart';
import '../../data/repository/menu_repository.dart';
import '../../logic/blocs/cart_bloc/cart_bloc.dart';
import '../../logic/blocs/cart_bloc/cart_event.dart';
import '../widgets/item_card.dart';
import 'cart_screen.dart';

class MenuScreen extends StatelessWidget {
  final String restaurantId;
  final String restaurantName;

  const MenuScreen({super.key, required this.restaurantId, required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuBloc(MenuRepository())..add(LoadMenu(restaurantId)),
      child: Scaffold(
        appBar: AppBar(title: Text(restaurantName)),
        body: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            if (state is MenuLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MenuLoaded) {
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ItemCard(
                    title: item.name,
                    subtitle: "₹${item.price}",
                    onAdd: () {
                      context.read<CartBloc>().add(AddItem(item));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart")),
                      );
                    },
                  );
                },
              );
            } else if (state is MenuError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
          },
        ),
      ),
    );
  }
}
