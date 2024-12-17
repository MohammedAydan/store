import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:store_app/routes/app_routes.dart';

class CustomAppBar extends GetView<AuthController> {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.cart);
                },
                icon: const Icon(Icons.card_travel_outlined),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.account);
                },
                icon: Obx(
                  () => CircleAvatar(
                    child: Text(
                      "${controller.user.value?.name?[0].toUpperCase()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.search);
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text("Search"),
          ),
        ),
      ],
    );
  }
}
