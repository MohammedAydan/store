import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/services/cart_services/i_cart_service.dart';

class CartService implements ICartService {
  @override
  Future<void> addToCart(ProductModel product) async {
    await Future.delayed(const Duration(seconds: 2));
    // Add product to cart
  }

  @override
  Future<void> removeFromCart(ProductModel product) async {
    await Future.delayed(const Duration(seconds: 2));
    // Remove product from cart
  }

  @override
  Future<void> clearCart() async {
    await Future.delayed(const Duration(seconds: 2));
    // Clear cart
  }

  @override
  Future<List<ProductModel>> getCart() async {
    await Future.delayed(const Duration(seconds: 2));
    // Get cart
    return [];
  }

  @override
  Future<dynamic> checkout() async {
    await Future.delayed(const Duration(seconds: 2));
    // Checkout
    // create transaction
    // send transaction to server
    // get response
    // Return the response
  }
}
