import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/orders/controllers/orders_controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(OrdersController(di()), permanent: true);
  }
}
