import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/home/controllers/search_products_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchProductsController(di()));
  }
}
