import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/modules/admin/controllers/customers_controller.dart';

class AddEditCustomerPage extends StatelessWidget {
  AddEditCustomerPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final CustomersController controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (controller.editingCustomer != null) {
      nameController.text = controller.editingCustomer?.name ?? "";
      emailController.text = controller.editingCustomer?.email ?? "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(controller.editingCustomer == null
            ? 'Add Customer'
            : 'Edit Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Customer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final customer = UserModel(
                      id: controller.editingCustomer == null
                          ? DateTime.now().millisecondsSinceEpoch.toString()
                          : controller.editingCustomer?.id,
                      name: nameController.text,
                      email: emailController.text,
                    );

                    if (controller.editingCustomer == null) {
                      controller.addCustomer(customer);
                    } else {
                      controller.editCustomer(customer);
                    }

                    controller.editingCustomer = null;
                  }
                },
                child: Text(controller.editingCustomer == null
                    ? 'Add Customer'
                    : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
