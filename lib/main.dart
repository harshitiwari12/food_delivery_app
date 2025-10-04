import 'package:flutter/material.dart';
import 'package:food_ordering_app/logic/blocs/cart_bloc/cart_bloc.dart';
import 'presentation/screens/restaurant_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        title: 'Food Ordering App',
        theme: AppTheme.lightTheme,
        home: const RestaurantListScreen(),
      ),
    );
  }
}
