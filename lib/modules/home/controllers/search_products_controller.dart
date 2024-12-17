import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/repositories/product_repository.dart';

class SearchProductsController extends GetxController {
  final ProductRepository _productRepository;
  final RxString search = "".obs;
  final RxList<ProductModel> products = RxList([]);
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;
  final RxInt page = 1.obs;
  final RxInt limit = 10.obs;
  final ScrollController scrollController = ScrollController();

  SearchProductsController(this._productRepository);

  void onSearch(String value) {
    search.value = value;
  }

  void onSearchSubmit() async {
    if (search.value.isNotEmpty) {
      await _searchProducts(reset: true);
      scrollController.addListener(_onScroll);
    }
  }

  Future<void> _searchProducts({bool reset = false}) async {
    if (reset) {
      page.value = 1;
      products.clear();
    }
    isLoading.value = true;
    error.value = "";
    Get.focusScope?.unfocus();
    try {
      final res = await _productRepository.searchProducts(
        search.value,
        page: page.value,
        limit: limit.value,
      );
      if (reset) {
        products.value = res;
      } else {
        products.addAll(res);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page.value++;
      _searchProducts();
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
