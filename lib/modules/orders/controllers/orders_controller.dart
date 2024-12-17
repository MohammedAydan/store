import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/order_model.dart';
import 'package:store_app/data/repositories/order_repository.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class OrdersController extends GetxController {
  final OrderRepository _orderRepository;
  final AuthController _authController;
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final ScrollController scrollController = ScrollController();
  final RxInt page = 1.obs;
  final RxInt limit = 10.obs;

  OrdersController(this._orderRepository, this._authController);

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
    try {
      if (_authController.user.value?.id == null) return;
      isLoading(true);
      error('');
      orders.addAll(await _orderRepository.getMyOrders(
        _authController.user.value!.id!,
        page: page.value,
        limit: limit.value,
      ));
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void deleteOrder(String orderId) async {
    try {
      isLoading(true);
      error('');
      await _orderRepository.deleteOrder(orderId);
      orders.removeWhere((order) => order.orderId == orderId);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void updateOrder(OrderModel order) async {
    try {
      isLoading(true);
      error('');
      await _orderRepository.updateOrder(order);
      int index = orders.indexWhere((o) => o.orderId == order.orderId);
      orders[index] = order;
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void createOrder(OrderModel order) async {
    try {
      isLoading(true);
      error('');
      await _orderRepository.createOrder(order);
      orders.add(order);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void getOrderById(String orderId) async {
    try {
      isLoading(true);
      error('');
      orders.value = [await _orderRepository.getOrderById(orderId)];
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void getOrders() async {
    try {
      isLoading(true);
      error('');
      orders.value = await _orderRepository.getOrders(
        limit: limit.value,
        page: page.value,
      );
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void clear() {
    orders.clear();
    error('');
  }

  void clearError() {
    error('');
  }
}
