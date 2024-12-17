import 'package:get/get.dart';
import 'package:store_app/data/repositories/cart_repository.dart';
import 'package:store_app/data/services/cart_services/cart_service.dart';
import 'package:store_app/data/services/cart_services/i_cart_service.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<CartController>(CartController(di(),Get.find()));
  }
}
