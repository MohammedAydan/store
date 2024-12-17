// tracking orders service interface
abstract class IOrderService {
  Future<dynamic> getOrders({int page = 1, int limit = 10});
  Future<dynamic> getMyOrders(String userId, {int page = 1, int limit = 10});
  Future<dynamic> getOrderById(String orderId);
  Future<dynamic> updateOrder(dynamic order);
  Future<dynamic> createOrder(dynamic order);
  Future<dynamic> deleteOrder(String orderId);
}
