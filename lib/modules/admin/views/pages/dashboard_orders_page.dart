import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/admin/controllers/dashboard_order_controller.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:intl/intl.dart';

class DashboardOrdersPage extends StatelessWidget {
  const DashboardOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final DashboardOrderController controller = Get.put(
      DashboardOrderController(di()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchOrders, // Refresh orders
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.orders.isEmpty) {
          return const Center(child: Text('No orders found.'));
        }

        return ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(order.orderId.toString()),
              ),
              title: Text(order.customerEmail),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status: ${order.status}',
                  ),
                  Text(
                    'Date: ${DateFormat.yMMMMEEEEd().format(order.orderDate)}',
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed(AppRoutes.dashboardOrderDetails, arguments: order);
              },
            );
          },
        );
      }),
    );
  }
}
