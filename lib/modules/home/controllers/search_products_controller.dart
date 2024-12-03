import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class SearchProductsController extends GetxController {
  final ProductRepository _productRepository;
  final RxString search = "".obs;
  final RxList<ProductModel> products = RxList([]);
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;

  SearchProductsController(this._productRepository);

  void onSearch(String value) {
    search.value = value;
  }

  void onSearchSubmit() async {
    if (search.value.isNotEmpty) {
      try {
        isLoading.value = true;
        error.value = "";
        products.clear();
        Get.focusScope?.unfocus();
        final res = await _productRepository.searchProducts(search.value);
        products.value = res;
      } catch (e) {
        print("errorr");
        print(e);
        error.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }
  }
}
