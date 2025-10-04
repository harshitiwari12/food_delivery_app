import '../models/order.dart';

class OrderRepository {
  Future<bool> placeOrder(Order order) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // always successful for mock
  }
}
