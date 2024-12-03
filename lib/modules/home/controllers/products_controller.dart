import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class ProductsController extends GetxController {
  final ProductRepository _productRepository;

  ProductsController(this._productRepository);

  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _productRepository.getProducts();
      products.assignAll(res);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void addProduct(dynamic product) async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _productRepository.addProduct(product);
      products.add(res);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void updateProduct(dynamic product) async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _productRepository.updateProduct(product);
      final index = products.indexWhere((element) => element.id == res.id);
      products[index] = res;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void deleteProduct(String id) async {
    try {
      error.value = "";
      isLoading.value = true;
      await _productRepository.deleteProduct(id);
      products.removeWhere((element) => element.id == id);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
