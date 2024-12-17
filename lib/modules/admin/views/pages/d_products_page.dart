import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/admin/controllers/d_products_controller.dart';
import 'package:store_app/modules/admin/views/pages/add_edit_product_page.dart';

class DProductsPage extends StatelessWidget {
  const DProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DProductsController controller = Get.put(
      DProductsController(di()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.to(() => AddEditProductPage());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(product.imageUrl),
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.deleteProduct(product.id);
                },
              ),
              onTap: () {
                controller.editingProduct?.value = product;
                Get.to(() => AddEditProductPage());
              },
            );
          },
        );
      }),
    );
  }
}
