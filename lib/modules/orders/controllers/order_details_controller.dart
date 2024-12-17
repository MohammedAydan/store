import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';

class OrderDetailsController extends GetxController {
  final orderModel = Rxn<OrderModel>(); // Use Rxn for nullable reactive types.
  final isLoading = false.obs;
  final error = "".obs;

  Future<void> fetchTrackingData() async {
    try {
      if (orderModel.value != null) {
        // orderModel.update((order) {
        //   order?.status = 'Delivered';
        // });

        // Simulate asynchronous updates to the tracking data.
        await Future.delayed(const Duration(seconds: 2));
        orderModel.update((order) {
          order?.received = DateTime.now().toLocal().toString();
          order?.status = "Received";
        });

        await Future.delayed(const Duration(seconds: 2));
        orderModel.update((order) {
          order?.inTransit = DateTime.now().toLocal().toString();
          order?.status = "In Transit";
        });

        await Future.delayed(const Duration(seconds: 2));
        orderModel.update((order) {
          order?.arrived = DateTime.now().toLocal().toString();
          order?.status = "Arrived";
        });

        await Future.delayed(const Duration(seconds: 2));
        orderModel.update((order) {
          order?.delivery = DateTime.now().toLocal().toString();
          order?.status = 'Delivered';
        });

        await Future.delayed(const Duration(seconds: 2));
        orderModel.update((order) {
          order?.completed = DateTime.now().toLocal().toString();
          order?.status = 'Completed';
        });
      }
    } catch (e) {
      error.value = e.toString(); // Capture any error that occurs.
    }
  }

  @override
  void onReady() {
    super.onReady();

    // Fetch order data from arguments if available.
    if (Get.arguments != null) {
      try {
        final data = OrderModel.fromJson(Get.arguments);
        orderModel.value = data;
        fetchTrackingData();
      } catch (e) {
        error.value = "Failed to parse order data: ${e.toString()}";
      }
    } else {
      error.value = "No order data provided.";
    }
  }
}
