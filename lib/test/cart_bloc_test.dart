import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:food_ordering_app/data/models/menu_items.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_event.dart';

import '../logic/blocs/cart_bloc/cart_state.dart';

void main() {
  group('CartBloc Test', () {
    late CartBloc cartBloc;
    setUp(() => cartBloc = CartBloc());

    test('Initial state is CartInitial', () {
      expect(cartBloc.state, CartInitial());
    });

    blocTest<CartBloc, CartState>(
      'AddItem updates cart',
      build: () => cartBloc,
      act: (bloc) => bloc.add(AddItem(MenuItem(id: '1', name: 'Pizza', price: 100))),
      expect: () => [isA<CartUpdated>()],
    );
  });
}
