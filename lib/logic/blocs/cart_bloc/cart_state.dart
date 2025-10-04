import 'package:equatable/equatable.dart';
import 'package:food_ordering_app/data/models/menu_items.dart';

abstract class CartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<MenuItem> items;

  CartUpdated(this.items);

  @override
  List<Object?> get props => [items];
}
