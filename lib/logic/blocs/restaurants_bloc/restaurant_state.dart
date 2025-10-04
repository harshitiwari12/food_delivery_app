import 'package:equatable/equatable.dart';
import 'package:food_ordering_app/data/models/restaurants.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantLoading extends RestaurantState {}
class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurants;
  RestaurantLoaded(this.restaurants);
  @override
  List<Object?> get props => [restaurants];
}
class RestaurantError extends RestaurantState {
  final String message;
  RestaurantError(this.message);
  @override
  List<Object?> get props => [message];
}
