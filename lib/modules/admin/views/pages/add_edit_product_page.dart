import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/modules/admin/controllers/d_products_controller.dart';

class AddEditProductPage extends StatelessWidget {
  AddEditProductPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final DProductsController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController stockQuantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController reviewsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (controller.editingProduct != null) {
      // Populate fields for editing
      nameController.text = controller.editingProduct?.value.name ?? '';
      descriptionController.text =
          controller.editingProduct?.value.description ?? '';
      priceController.text =
          controller.editingProduct?.value.price.toString() ?? '';
      discountController.text =
          controller.editingProduct?.value.discount.toString() ?? '';
      imageUrlController.text = controller.editingProduct?.value.imageUrl ?? '';
      stockQuantityController.text =
          controller.editingProduct?.value.stockQuantity.toString() ?? '';
      categoryController.text = controller.editingProduct?.value.category ?? '';
      brandController.text = controller.editingProduct?.value.brand ?? '';
      ratingController.text =
          controller.editingProduct?.value.rating.toString() ?? '';
      reviewsController.text =
          controller.editingProduct?.value.reviews.join(', ') ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            controller.editingProduct == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: discountController,
                  decoration: const InputDecoration(
                    labelText: 'Discount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a discount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: stockQuantityController,
                  decoration: const InputDecoration(
                    labelText: 'Stock Quantity',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter stock quantity';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: brandController,
                  decoration: const InputDecoration(
                    labelText: 'Brand',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a brand';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: ratingController,
                  decoration: const InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: reviewsController,
                  decoration: const InputDecoration(
                    labelText: 'Reviews (comma separated)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter reviews';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final product = ProductModel(
                          id: controller.editingProduct?.value.id ?? '',
                          name: nameController.text,
                          description: descriptionController.text,
                          price: double.parse(priceController.text),
                          discount: double.parse(discountController.text),
                          imageUrl: imageUrlController.text,
                          stockQuantity:
                              int.parse(stockQuantityController.text),
                          category: categoryController.text,
                          brand: brandController.text,
                          rating: double.parse(ratingController.text),
                          reviews: reviewsController.text
                              .split(',')
                              .map((e) => e.trim())
                              .toList(),
                        );

                        if (controller.editingProduct == null) {
                          controller.addProduct(product);
                        } else {
                          controller.editProduct(product);
                        }

                        controller.editingProduct = null;
                        Get.back();
                      }
                    },
                    child: Text(controller.editingProduct == null
                        ? 'Add Product'
                        : 'Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
