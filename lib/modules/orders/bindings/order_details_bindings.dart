import 'package:get/get.dart';
import 'package:store_app/modules/orders/controllers/order_details_controller.dart';

class OrderDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsController(), fenix: true);
  }
}
