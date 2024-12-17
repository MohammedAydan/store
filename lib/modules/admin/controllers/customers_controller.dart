import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/repositories/user_repository.dart';

class CustomersController extends GetxController {
  final UserRepository _userRepository;
  RxList<UserModel> customers = RxList<UserModel>([]);
  var isLoading = false.obs;
  UserModel? editingCustomer;
  final ScrollController scrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt limit = 10.obs;
  RxString error = ''.obs;

  // Search query
  var searchQuery = ''.obs;

  CustomersController(this._userRepository);

  @override
  void onInit() {
    super.onInit();
    fetchCustomers();
    scrollController.addListener(() {
      if (isLoading.isTrue) return;
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page.value++;
        fetchCustomers();
      }
    });
  }

  // Simulate fetching customers from an API
  void fetchCustomers() async {
    isLoading.value = true;
    try {
      final res = await _userRepository.getAllUsers(
            page: page.value,
            limit: limit.value,
          ) ??
          [];
      customers.addAll(res);
    } catch (e) {
      error.value = 'Failed to fetch customers: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // Add a new customer
  void addCustomer(UserModel customer) async {
    try {
      await _userRepository.createUser(customer.email??"", "password");
      customers.add(customer);
      Get.back(); // Close the add customer page
    } catch (e) {
      error.value = 'Failed to add customer: $e';
    }
  }

  // Edit an existing customer
  void editCustomer(UserModel updatedCustomer) async {
    try {
      await _userRepository.updateUser(updatedCustomer.email??"", "password");
      int index = customers.indexWhere((c) => c.id == updatedCustomer.id);
      if (index != -1) {
        customers[index] = updatedCustomer;
      }
      Get.back(); // Close the edit customer page
    } catch (e) {
      error.value = 'Failed to edit customer: $e';
    }
  }

  // Delete a customer
  void deleteCustomer(String id) async {
    try {
      await _userRepository.deleteUser(id);
      customers.removeWhere((customer) => customer.id == id);
    } catch (e) {
      error.value = 'Failed to delete customer: $e';
    }
  }

  // Search customers
  void searchCustomers(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      customers.assignAll([]);
      fetchCustomers();
    } else {
      customers.assignAll(
        customers.where((customer) {
          return customer.email!.toLowerCase().contains(query.toLowerCase());
        }).toList(),
      );
    }
  }

  // changeRole
  void changeRole(String email, String role) async {
    try {
      await _userRepository.changeRole(email, role);
    } catch (e) {
      error.value = 'Failed to change role: $e';
    }
  }
}
