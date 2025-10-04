import 'package:food_ordering_app/data/models/restaurants.dart';

class RestaurantRepository {
  Future<List<Restaurant>> fetchRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      Restaurant(id: "1", name: "Food Paradise", description: "Best biryani in town"),
      Restaurant(id: "2", name: "Pizza Hub", description: "Cheesy delight pizzas"),
      Restaurant(id: "3", name: "Burger World", description: "Juicy and tasty burgers"),
    ];
  }
}
