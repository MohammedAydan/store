import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/cart_repository.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class CartController extends GetxController {
  final CartRepository _cartRepository;
  final AuthController _authController;

  CartController(this._cartRepository, this._authController);

  // Reactive states
  final cartItems = <ProductModel>[].obs;
  final isLoading = false.obs;
  final isProductLoading = <String>{}.obs; // Use a Set for efficiency
  final error = ''.obs;
  final totalPrice = 0.0.obs;
  final page = 1.obs;
  final limit = 10.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getCart();
    scrollController.addListener(() {
      if (isLoading.isTrue) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;
        getCart();
      }
    });
  }

  Future<void> getCart() async {
    try {
      if (_authController.user.value?.id == null) return;
      isLoading.value = true;
      error.value = '';
      final cart = await _cartRepository.getCart(
        _authController.user.value!.id!,
        page: page.value,
        limit: limit.value,
      );
      cartItems.assignAll(cart);
      calcTotal();
    } catch (e) {
      error.value = 'Failed to load cart: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addToCart(ProductModel product) async {
    try {
      isLoading.value = true;
      await _cartRepository.addToCart(product);
      cartItems.add(product);
      calcTotal();
    } catch (e) {
      error.value = 'Failed to add product to cart: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFromCart(ProductModel product) async {
    if (isProductLoading.contains(product.id)) return;

    try {
      isProductLoading.add(product.id);
      await _cartRepository.removeFromCart(product);
      cartItems.remove(product);
      calcTotal();
    } catch (e) {
      error.value = 'Failed to remove product: $e';
    } finally {
      isProductLoading.remove(product.id);
    }
  }

  void clearCart() async {
    try {
      isLoading.value = true;
      await _cartRepository.clearCart();
      cartItems.clear();
      calcTotal();
    } catch (e) {
      error.value = 'Failed to clear cart: $e';
    } finally {
      isLoading.value = false;
    }
  }

  void calcTotal() {
    totalPrice.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }

  void checkout() async {
    try {
      isLoading.value = true;
      error.value = "";
      final res = await _cartRepository.checkout();
      // Do something with the response
    } catch (e) {
      error.value = 'Failed to checkout: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
