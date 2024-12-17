import 'package:store_app/data/models/order_model.dart';

final testData = [
  ...[0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(
    (e) => OrderModel(
      customerName: 'John Doe - $e',
      customerEmail: "JohnDoe@ex.com",
      customerPhone: "01152345682",
      deliveryAddress: "123 Main Street, New York, NY 10001",
      orderDate: DateTime.now(),
      paymentMethod: 'Credit Card',
      totalAmount: 150.0 + e,
      status: 'Delivered',
      orderItemsId: '1',
      orderId: '1$e',
    ).toJson(),
  ),
];
