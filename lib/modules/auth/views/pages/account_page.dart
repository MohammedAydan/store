import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:store_app/modules/orders/views/pages/orders_page.dart';
import 'package:store_app/modules/auth/views/widgets/account_bottom_nav_bar.dart';
import 'package:store_app/modules/auth/views/widgets/user_filed.dart';
import 'package:store_app/routes/app_routes.dart';

class AccountPage extends GetView<AuthController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard),
            onPressed: () {
              Get.toNamed(AppRoutes.dashboard);
            },
          ),
        ],
      ),
      body: Obx(() {
        // Show loading indicator if the controller is loading
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Show message if no user is logged in
        else if (controller.user.value == null) {
          return const Center(child: Text('No user logged in'));
        }

        // Display user information if the user is logged in
        else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User avatar with the first letter of the name
                  Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Get.theme.primaryColor,
                      child: Text(
                        "${controller.user.value?.name?[0].toUpperCase()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // User details section
                  UserFiled(
                      name: "Name", data: controller.user.value?.name ?? ""),
                  const SizedBox(height: 10),
                  UserFiled(
                      name: "Email", data: controller.user.value?.email ?? ""),
                  const SizedBox(height: 10),
                  UserFiled(
                    name: "Phone number",
                    data: controller.user.value?.phoneNumber ?? "",
                  ),
                  const SizedBox(height: 10),
                  UserFiled(
                      name: "City", data: controller.user.value?.city ?? ""),
                  const SizedBox(height: 10),
                  UserFiled(
                    name: "Address",
                    data: controller.user.value?.address ?? "",
                  ),
                  const SizedBox(height: 20),

                  // Edit Profile button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.editAccount);
                      },
                      child: const Text('Edit Profile'),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Track Orders button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Get.theme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                      onPressed: () {
                        Get.to(() => const OrdersPage());
                      },
                      child: const Text('Orders'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: AccountBottomNavBar(controller: controller),
    );
  }
}
