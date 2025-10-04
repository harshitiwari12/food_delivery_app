import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/repository/restaurants_repository.dart';
import 'package:food_ordering_app/logic/blocs/restaurants_bloc/restaurant_bloc.dart';
import 'package:food_ordering_app/logic/blocs/restaurants_bloc/restaurant_event.dart';
import 'package:food_ordering_app/logic/blocs/restaurants_bloc/restaurant_state.dart';
import 'menu_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantBloc(RestaurantRepository())..add(LoadRestaurants()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Restaurants")),
        body: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RestaurantLoaded) {
              return ListView.builder(
                itemCount: state.restaurants.length,
                itemBuilder: (context, index) {
                  final r = state.restaurants[index];
                  return ListTile(
                    title: Text(r.name),
                    subtitle: Text(r.description),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MenuScreen(restaurantId: r.id, restaurantName: r.name)));
                    },
                  );
                },
              );
            } else if (state is RestaurantError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
