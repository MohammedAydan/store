import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/modules/orders/controllers/order_details_controller.dart';
import 'package:store_app/modules/orders/views/widgets/order_tracker_widget.dart';
import 'package:store_app/modules/orders/views/widgets/tracking_history_widget.dart';

class OrderDetailsPage extends GetView<OrderDetailsController> {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Obx(() {
        final tracking = controller.orderModel.value;
        final isLoading = controller.isLoading.value;
        final error = controller.error.value;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (error.isNotEmpty) {
          return Center(child: Text('Error: $error'));
        }

        if (tracking == null) {
          return const Center(child: Text('No order details available.'));
        }

        return Column(
          children: [
            _buildHeader(tracking),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tracking Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    OrderTrackerWidget(order: tracking),
                    const SizedBox(height: 20),
                    const Text(
                      'Tracking History:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TrackingHistorysWidget(controller: controller),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader(OrderModel tracking) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: ${tracking.orderId ?? 'N/A'}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Status: ${tracking.status ?? 'Unknown'}',
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
