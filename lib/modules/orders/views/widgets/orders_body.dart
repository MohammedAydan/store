import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/modules/orders/controllers/orders_controller.dart';
import 'package:store_app/modules/orders/views/widgets/order_card.dart';

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key, required this.controller});

  final OrdersController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.error.isNotEmpty) ...[
            Center(child: Text(controller.error.value)),
            const SizedBox(height: 20),
          ],
          if (controller.isLoading.isFalse && controller.orders.isEmpty) ...[
            const SizedBox(height: 20),
            const Center(child: Text('No orders found')),
            const SizedBox(height: 20),
          ],
          if (controller.orders.isNotEmpty) ...[
            Expanded(
              child: ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  OrderModel order = controller.orders[index];
                  return OrderCard(order: order);
                },
              ),
            ),
          ],
          if (controller.isLoading.isTrue) ...[
            const Center(child: CircularProgressIndicator()),
          ]
        ],
      ),
    );
  }
}
