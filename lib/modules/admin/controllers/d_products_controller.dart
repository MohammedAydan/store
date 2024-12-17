import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class DProductsController extends GetxController {
  final ProductRepository _productRepository;
  // List of products
  RxList<ProductModel> products = RxList([]);

  // Loading state
  var isLoading = false.obs;

  // Product being edited/added
  Rx<ProductModel>? editingProduct;

  DProductsController(this._productRepository);
  final ScrollController scrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt limit = 10.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    scrollController.addListener(() {
      if (isLoading.isTrue) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;
        fetchProducts();
      }
    });
  }

  // Simulate fetching products from an API
  void fetchProducts() async {
    isLoading.value = true;
    final res = await _productRepository.getProducts(
          page: page.value,
          limit: limit.value,
        ) ??
        [];
    products.addAll(res);

    isLoading.value = false;
  }

  // Add a new product
  void addProduct(ProductModel product) {
    products.add(product);
    Get.back(); // Close the add product page
  }

  // Edit an existing product
  void editProduct(ProductModel updatedProduct) {
    int index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
    Get.back(); // Close the edit product page
  }

  // Delete a product
  void deleteProduct(String id) {
    products.removeWhere((product) => product.id == id);
  }
}
