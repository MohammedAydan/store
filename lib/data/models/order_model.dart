import 'dart:convert';

class OrderModel {
  String orderId;
  String customerName;
  String customerEmail;
  String customerPhone;
  DateTime orderDate;
  String deliveryAddress;
  String paymentMethod;
  String status;
  double totalAmount;
  String orderItemsId;
  // Tracking steps 
  String? received;
  String? inTransit;
  String? arrived;
  String? delivery;
  String? completed;

  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.orderDate,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.status,
    required this.totalAmount,
    required this.orderItemsId,
    this.received,
    this.inTransit,
    this.arrived,
    this.delivery,
    this.completed,
  });

  OrderModel copyWith({
    String? orderId,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    DateTime? orderDate,
    String? deliveryAddress,
    String? paymentMethod,
    String? status,
    double? totalAmount,
    String? orderItemsId,
    String? received,
    String? inTransit,
    String? arrived,
    String? delivery,
    String? completed,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      orderDate: orderDate ?? this.orderDate,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      orderItemsId: orderItemsId ?? this.orderItemsId,
      received: received ?? received,
      inTransit: inTransit ?? inTransit,
      arrived: arrived ?? this.arrived,
      delivery: delivery ?? this.delivery,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'customerName': customerName,
      'customerEmail': customerEmail,
      'customerPhone': customerPhone,
      'orderDate': orderDate.toIso8601String(),
      'deliveryAddress': deliveryAddress,
      'paymentMethod': paymentMethod,
      'status': status,
      'totalAmount': totalAmount,
      'orderItemsId': orderItemsId,
      'received': received,
      'inTransit': inTransit,
      'arrived': arrived,
      'delivery': delivery,
      'completed': completed,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      customerName: map['customerName'],
      customerEmail: map['customerEmail'],
      customerPhone: map['customerPhone'],
      orderDate: DateTime.parse(map['orderDate']),
      deliveryAddress: map['deliveryAddress'],
      paymentMethod: map['paymentMethod'],
      status: map['status'],
      totalAmount: map['totalAmount'],
      orderItemsId: map['orderItemsId'],
      received: map['received'],
      inTransit: map['inTransit'],
      arrived: map['arrived'],
      delivery: map['delivery'],
      completed: map['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
