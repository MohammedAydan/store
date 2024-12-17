import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';
import 'package:store_app/modules/home/controllers/home_controller.dart';
import 'package:store_app/modules/home/controllers/products_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(di()));
    Get.put<ProductsController>(ProductsController(di()));
    Get.put<CartController>(CartController(di(), Get.find()));
  }
}
