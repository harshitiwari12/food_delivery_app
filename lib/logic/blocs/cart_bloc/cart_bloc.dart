import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/menu_items.dart';
import 'cart_event.dart';
import 'cart_state.dart';
class CartBloc extends Bloc<CartEvent, CartState> {
  final List<MenuItem> _cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<AddItem>((event, emit) {
      _cartItems.add(event.item);
      emit(CartUpdated(List.from(_cartItems)));
    });

    on<RemoveItem>((event, emit) {
      _cartItems.remove(event.item);
      emit(CartUpdated(List.from(_cartItems)));
    });

    on<ClearCart>((event, emit) {
      _cartItems.clear();
      emit(CartUpdated(List.from(_cartItems)));
    });
  }

  List<MenuItem> get cartItems => List.unmodifiable(_cartItems);
}
