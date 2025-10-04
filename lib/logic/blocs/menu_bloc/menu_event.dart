import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMenu extends MenuEvent {
  final String restaurantId;

  LoadMenu(this.restaurantId);

  @override
  List<Object?> get props => [restaurantId];
}
