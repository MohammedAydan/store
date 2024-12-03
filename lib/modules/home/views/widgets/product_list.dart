import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/home/controllers/products_controller.dart';
import 'package:store_app/modules/home/views/widgets/product_card.dart';

class ProductList extends GetView<ProductsController> {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(20),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       const Text(
        //         'Products',
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       IconButton(
        //         icon: const Icon(Icons.arrow_forward),
        //         onPressed: () {
        //           //
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 30),
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.isLoading.isFalse &&
              controller.error.value.isNotEmpty) {
            return GestureDetector(
              onTap: controller.getProducts,
              child: Center(
                child: Text(controller.error.value),
              ),
            );
          }

          if (controller.isLoading.isFalse && controller.products.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: controller.products[index]);
            },
          );
        }),
      ],
    );
  }
}
