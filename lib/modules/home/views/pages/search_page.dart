import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/home/controllers/search_products_controller.dart';
import 'package:store_app/modules/home/views/widgets/product_card.dart';

class SearchPage extends GetView<SearchProductsController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: controller.onSearch,
                    onFieldSubmitted: (v) => controller.onSearchSubmit(),
                  ),
                ),
                Obx(() {
                  if (controller.isLoading.isTrue) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (controller.search.value.isNotEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: controller.onSearchSubmit,
                        icon: const Icon(Icons.search, color: Colors.white),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                }),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: Column(
                  children: [
                    if (controller.search.value.isEmpty) ...[
                      const Text('Search for products'),
                    ],
                    if (controller.isLoading.isFalse &&
                        controller.error.isNotEmpty) ...[
                      Text(controller.error.value),
                    ],
                    if (controller.isLoading.isFalse &&
                        controller.products.isEmpty) ...[
                      const Text('No products found'),
                    ],
                    if (controller.products.isNotEmpty) ...[
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            final product = controller.products[index];
                            return ProductCard(product: product);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
