import 'package:equatable/equatable.dart';
import 'package:food_ordering_app/data/models/menu_items.dart';


abstract class MenuState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuItem> items;

  MenuLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class MenuError extends MenuState {
  final String message;

  MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
