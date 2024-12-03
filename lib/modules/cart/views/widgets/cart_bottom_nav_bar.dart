import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    super.key,
    required this.controller,
  });

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total: \$${controller.totalPrice}',
                      style: Get.theme.textTheme.titleSmall,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              Get.theme.textTheme.headlineMedium?.color,
                          backgroundColor:
                              Get.theme.colorScheme.secondaryContainer,
                        ),
                        onPressed: controller.cartItems.isEmpty
                            ? null
                            : controller.checkout,
                        child: const Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
