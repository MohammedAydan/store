import 'package:store_app/data/models/product_model.dart';

abstract class ICartService {
  Future<void> addToCart(ProductModel product);
  Future<void> removeFromCart(ProductModel product);
  Future<void> clearCart();
  Future<List<ProductModel>> getCart();
  Future<dynamic> checkout();
}