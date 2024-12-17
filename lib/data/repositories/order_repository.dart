import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/data/services/tracking_services/i_order_service.dart';

class OrderRepository {
  final IOrderService _orderService;

  OrderRepository(this._orderService);

  Future<OrderModel> createOrder(order) async {
    return OrderModel.fromJson(await _orderService.createOrder(order));
  }

  Future<OrderModel> deleteOrder(String orderId) async {
    return OrderModel.fromJson(await _orderService.deleteOrder(orderId));
  }

  Future<List<OrderModel>> getMyOrders(
    String userId, {
    int limit = 10,
    int page = 0,
  }) async {
    List res = await _orderService.getMyOrders(
      userId,
      limit: limit,
      page: page,
    );

    return res.map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<OrderModel> getOrderById(String orderId) async {
    return OrderModel.fromJson(await _orderService.getOrderById(orderId));
  }

  Future<List<OrderModel>> getOrders({int page = 1, int limit = 10}) async {
    List res = await _orderService.getOrders(
      limit: limit,
      page: page,
    );

    return res.map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<OrderModel> updateOrder(order) async {
    return OrderModel.fromJson(await _orderService.updateOrder(order));
  }
}
