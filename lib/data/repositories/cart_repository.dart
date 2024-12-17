import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/services/cart_services/i_cart_service.dart';

class CartRepository {
  final ICartService _cartService;

  CartRepository(this._cartService);

  Future<void> addToCart(ProductModel product) async {
    await _cartService.addToCart(product);
  }

  Future<void> removeFromCart(ProductModel product) async {
    await _cartService.removeFromCart(product);
  }

  Future<void> clearCart() async {
    await _cartService.clearCart();
  }

  Future<List<ProductModel>> getCart(
    String userId, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _cartService.getCart(
      userId,
      page: page,
      limit: limit,
    );
  }

  Future<dynamic> checkout() async {
    final res = await _cartService.checkout();
    // convert res to a model
    return res;
  }
}
