import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/orders/controllers/orders_controller.dart';
import 'package:store_app/modules/orders/views/widgets/orders_body.dart';

class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: OrdersBody(controller: controller),
    );
  }
}
