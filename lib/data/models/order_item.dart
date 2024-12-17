import 'dart:convert';

class OrderItem {
  String productId;
  String productName;
  int quantity;
  double price;
  String? imageUrl;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  OrderItem copyWith({
    String? productId,
    String? productName,
    int? quantity,
    double? price,
    String? imageUrl,
  }) {
    return OrderItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId'],
      productName: map['productName'],
      quantity: map['quantity'],
      price: map['price'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) =>
      OrderItem.fromMap(json.decode(source));
}
