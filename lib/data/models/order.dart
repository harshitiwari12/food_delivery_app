
import 'package:food_ordering_app/data/models/menu_items.dart';

class Order {
  final List<MenuItem> items;
  final double total;

  Order({required this.items, required this.total});
}
