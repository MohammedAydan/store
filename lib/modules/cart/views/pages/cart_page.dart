import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';
import 'package:store_app/modules/cart/views/widgets/cart_bottom_nav_bar.dart';
import 'package:store_app/routes/app_routes.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            if (controller.isLoading.isFalse &&
                controller.error.isNotEmpty) ...[
              Center(
                child: Text(
                  controller.error.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            if (controller.cartItems.isEmpty) ...[
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Your cart is empty.\nStart shopping now!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            if (controller.cartItems.isNotEmpty) ...[
              Expanded(
                child: ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = controller.cartItems[index];
                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(AppRoutes.product, arguments: product);
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.imageUrl,
                            width: 60,
                            height: 80,
                            fit: BoxFit.contain,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 60);
                            },
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        trailing: controller.isProductLoading
                                .contains(product.id)
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(),
                              )
                            : IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  controller.removeFromCart(product);
                                },
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
            if (controller.isLoading.value) ...[
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
      bottomNavigationBar: CartBottomNavBar(controller: controller),
    );
  }
}
