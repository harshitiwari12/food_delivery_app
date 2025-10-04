import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app/data/repository/restaurants_repository.dart';
import 'restaurant_event.dart';
import 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepository repository;
  RestaurantBloc(this.repository) : super(RestaurantLoading()) {
    on<LoadRestaurants>((event, emit) async {
      try {
        final data = await repository.fetchRestaurants();
        emit(RestaurantLoaded(data));
      } catch (_) {
        emit(RestaurantError("Failed to load restaurants"));
      }
    });
  }
}
