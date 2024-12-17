import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/data/repositories/order_repository.dart';

class DashboardOrderController extends GetxController {
  final OrderRepository? _orderRepository;
  DashboardOrderController(this._orderRepository);

  RxList<OrderModel> orders = RxList([]);
  RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt limit = 10.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
    scrollController.addListener(() {
      if (isLoading.isTrue) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;
        fetchOrders();
      }
    });
  }

  void fetchOrders() async {
    isLoading.value = true;
    final res = await _orderRepository?.getOrders(
          page: page.value,
          limit: limit.value,
        ) ??
        [];
    orders.assignAll(res);
    isLoading.value = false;
  }
}
