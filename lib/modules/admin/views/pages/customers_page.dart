import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/admin/controllers/customers_controller.dart';
import 'package:store_app/modules/admin/views/pages/add_edit_customer_page.dart';

class CustomersPage extends StatelessWidget {
  CustomersPage({super.key});
  final CustomersController controller = Get.put(CustomersController(di()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => AddEditCustomerPage());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.customers.isEmpty) {
                return const Center(child: Text('No customers found.'));
              }

              return ListView.builder(
                itemCount: controller.customers.length,
                itemBuilder: (context, index) {
                  final customer = controller.customers[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(customer.id.toString()),
                    ),
                    title: Text(customer.name ?? ''),
                    subtitle: Text(customer.email ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        controller.deleteCustomer(customer.id ?? "");
                      },
                    ),
                    onTap: () {
                      controller.editingCustomer = customer;
                      Get.to(() => AddEditCustomerPage());
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
