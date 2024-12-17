import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/edit_account_controller.dart';
import 'package:store_app/modules/auth/views/widgets/custom_dropdown_buttom.dart';
import 'package:store_app/modules/auth/views/widgets/custom_text_form_field.dart';
import 'package:store_app/modules/auth/views/widgets/edit_account_bottom_nav_bar.dart';

class EditAccountPage extends GetView<EditAccountController> {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Account"),
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.error.isNotEmpty) ...[
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            controller.error.value,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  CustomTextFormField(
                    labelText: "Username",
                    controller: controller.usernameController,
                    validator: (value) =>
                        value!.isEmpty ? "Username cannot be empty" : null,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Email",
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty
                        ? "Email cannot be empty"
                        : (!value.contains('@') ? "Invalid email" : null),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Phone Number",
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value!.isEmpty ? "Phone number cannot be empty" : null,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdownButtom(
                    controller: controller,
                    items: controller.cities,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Address",
                    controller: controller.addressController,
                    maxLines: 3,
                    maxLength: 200,
                    validator: (value) =>
                        value!.isEmpty ? "Address cannot be empty" : null,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: EditAccountBottomNavBar(controller: controller),
    );
  }
}
