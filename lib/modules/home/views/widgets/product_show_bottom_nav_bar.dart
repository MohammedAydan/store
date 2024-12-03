import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';

class ProductShowBottomNavBar extends StatelessWidget {
  ProductShowBottomNavBar({
    super.key,
    required this.product,
  });

  final ProductModel product;
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: product.stockQuantity > 0
                  ? Obx(
                      () => TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Get.theme.textTheme.headlineMedium?.color,
                          backgroundColor:
                              Get.theme.colorScheme.secondaryContainer,
                        ),
                        onPressed: cartController.isLoading.isTrue
                            ? null
                            : () {
                                cartController.addToCart(product);
                              },
                        child: cartController.isLoading.isTrue
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const Text("Add to cart"),
                      ),
                    )
                  : const Center(child: Text("Out of stock")),
            ),
          ),
        ],
      ),
    );
  }
}
