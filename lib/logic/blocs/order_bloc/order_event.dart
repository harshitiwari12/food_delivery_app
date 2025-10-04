import 'package:equatable/equatable.dart';
import '../../../data/models/order.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlaceOrder extends OrderEvent {
  final Order order;

  PlaceOrder(this.order);

  @override
  List<Object?> get props => [order];
}
