import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_event.dart';
import 'order_state.dart';
import '../../../data/repository/order_repository.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository repository;

  OrderBloc(this.repository) : super(OrderInitial()) {
    on<PlaceOrder>((event, emit) async {
      emit(OrderPlacing());
      try {
        await repository.placeOrder(event.order);
        emit(OrderPlaced(event.order));
      } catch (e) {
        emit(OrderError("Failed to place order"));
      }
    });
  }
}
