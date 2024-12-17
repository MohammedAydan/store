import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class ProductsController extends GetxController {
  final ProductRepository _productRepository;

  ProductsController(this._productRepository);

  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;
  final RxInt page = 1.obs;
  final RxInt limit = 10.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getProducts();
    scrollController.addListener(() {
      if(isLoading.isTrue) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;
        getProducts();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void getProducts() async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _productRepository.getProducts(
        page: page.value,
        limit: limit.value,
      );
      products.addAll(res);
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
