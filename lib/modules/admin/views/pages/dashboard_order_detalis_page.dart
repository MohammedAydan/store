import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';

class DashboardOrderDetailsPage extends StatelessWidget {
  const DashboardOrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to edit order page
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Confirm and delete order
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Order ID'),
              subtitle: Text(order.orderId),
            ),
            ListTile(
              title: const Text('Customer Email'),
              subtitle: Text(order.customerEmail),
            ),
            ListTile(
              title: const Text('Status'),
              subtitle: Text(order.status),
            ),
            ListTile(
              title: const Text('Total Amount'),
              subtitle: Text('\$${order.totalAmount.toStringAsFixed(2)}'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate marking order as delivered
                Get.snackbar(
                  'Success',
                  'Order marked as delivered!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Mark as Delivered'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Simulate marking order as cancelled
                Get.snackbar(
                  'Success',
                  'Order marked as cancelled!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Mark as Cancelled'),
            ),
          ],
        ),
      ),
    );
  }
}
