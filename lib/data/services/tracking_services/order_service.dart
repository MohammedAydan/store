import 'package:store_app/data/services/tracking_services/i_order_service.dart';
import 'package:store_app/data/services/tracking_services/test_data.dart';

class OrderService implements IOrderService {
  @override
  Future createOrder(order) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future deleteOrder(String orderId) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future getMyOrders(String userId, {int page = 1, int limit = 10}) {
    return Future.value(testData);
  }

  @override
  Future getOrderById(String orderId) {
    // TODO: implement getOrderById
    throw UnimplementedError();
  }

  @override
  Future getOrders({int page = 1, int limit = 10}) {
    return Future.value(testData);
  }

  @override
  Future updateOrder(order) {
    // TODO: implement updateOrder
    throw UnimplementedError();
  }
}
