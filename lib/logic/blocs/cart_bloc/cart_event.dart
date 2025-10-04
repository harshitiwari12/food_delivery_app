import 'package:equatable/equatable.dart';
import 'package:food_ordering_app/data/models/menu_items.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddItem extends CartEvent {
  final MenuItem item;

  AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends CartEvent {
  final MenuItem item;

  RemoveItem(this.item);

  @override
  List<Object?> get props => [item];
}

class ClearCart extends CartEvent {}
