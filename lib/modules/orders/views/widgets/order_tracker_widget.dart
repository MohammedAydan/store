import 'package:flutter/material.dart';
import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/modules/orders/views/widgets/progress_step_widget.dart';

class OrderTrackerWidget extends StatelessWidget {
  const OrderTrackerWidget({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProgressStepWidget(
          label: "Received",
          icon: Icons.check_circle,
          color: Colors.green,
          isCompleted: order.received != null,
        ),
        ProgressStepWidget(
          label: "In Transit",
          icon: Icons.local_shipping,
          color: Colors.orange,
          isCompleted: order.inTransit != null,
        ),
        ProgressStepWidget(
          label: "Arrived",
          icon: Icons.location_on,
          color: Colors.blue,
          isCompleted: order.arrived != null,
        ),
        ProgressStepWidget(
          label: "Delivery",
          icon: Icons.home,
          color: Colors.red,
          isCompleted: order.delivery != null,
        ),
        ProgressStepWidget(
          label: "Completed",
          icon: Icons.check_circle,
          color: Colors.green,
          isCompleted: order.completed != null,
        ),
      ],
    );
  }
}
