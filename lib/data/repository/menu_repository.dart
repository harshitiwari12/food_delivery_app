import '../models/menu_items.dart';

class MenuRepository {
  Future<List<MenuItem>> fetchMenu(String restaurantId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      MenuItem(id: "m1", name: "Chicken Biryani", price: 180),
      MenuItem(id: "m2", name: "Veg Pizza", price: 150),
      MenuItem(id: "m3", name: "Cheese Burger", price: 120),
    ];
  }
}
