import 'package:flutter/material.dart';
import 'package:store_app/data/models/tracking_history.dart';
import 'package:store_app/modules/orders/controllers/order_details_controller.dart';

class TrackingHistorysWidget extends StatelessWidget {
  const TrackingHistorysWidget({
    super.key,
    required this.controller,
  });

  final OrderDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (controller.orderModel.value?.received != null) ...[
          ListTile(
            title: const Text('Package received at warehouse'),
            subtitle: Text('${controller.orderModel.value?.received}'),
            // leading: const Icon(Icons.),
            leading: const Icon(Icons.check_circle),
            iconColor: Colors.green,
          ),
        ],
        if (controller.orderModel.value?.inTransit != null) ...[
          ListTile(
            title: const Text('Package in transit'),
            subtitle: Text('${controller.orderModel.value?.inTransit}'),
            leading: const Icon(Icons.local_shipping),
            iconColor: Colors.orange,
          ),
        ],
        if (controller.orderModel.value?.arrived != null) ...[
          ListTile(
            title: const Text('Package arrived at destination city'),
            subtitle: Text('${controller.orderModel.value?.arrived}'),
            leading: const Icon(Icons.location_on),
            iconColor: Colors.blue,
          ),
        ],
        if (controller.orderModel.value?.delivery != null) ...[
          ListTile(
            title: const Text('Out for delivery'),
            subtitle: Text('${controller.orderModel.value?.delivery}'),
            leading: const Icon(Icons.home),
            iconColor: Colors.red,
          ),
        ],
        if (controller.orderModel.value?.completed != null) ...[
          ListTile(
            title: const Text('Package delivered'),
            subtitle: Text('${controller.orderModel.value?.completed}'),
            leading: const Icon(Icons.check_circle),
            iconColor: Colors.green,
          ),
        ],
      ],
    );
  }
}

final List<TrackingHistory> trackingHistory = [
  TrackingHistory(
    title: 'Package received at warehouse',
    subtitle: '2023-10-01 10:00 AM',
    icon: Icons.check_circle,
    iconColor: Colors.green,
  ),
  TrackingHistory(
    title: 'Package in transit',
    subtitle: '2023-10-02 02:00 PM',
    icon: Icons.local_shipping,
    iconColor: Colors.orange,
  ),
  TrackingHistory(
    title: 'Package arrived at destination city',
    subtitle: '2023-10-03 09:00 AM',
    icon: Icons.location_on,
    iconColor: Colors.blue,
  ),
  TrackingHistory(
    title: 'Out for delivery',
    subtitle: '2023-10-04 08:00 AM',
    icon: Icons.home,
    iconColor: Colors.red,
  ),
  TrackingHistory(
    title: 'Package delivered',
    subtitle: '2023-10-05 03:00 PM',
    icon: Icons.check_circle,
    iconColor: Colors.green,
  ),
];

TrackingHistory getTrackingHistory(int index) {
  return trackingHistory[index % trackingHistory.length];
}
