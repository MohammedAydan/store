import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class SplashPage extends GetView<AuthController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 5),
          Center(
            child: Text(
              "Store",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Get.theme.primaryColor,
              ),
            ),
          ),
          const Spacer(flex: 3),
          Obx(() {
            if (controller.error.value.isNotEmpty) {
              return Card.filled(
                color: Get.theme.colorScheme.error,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    controller.error.value,
                    style: TextStyle(
                      color: Get.theme.primaryTextTheme.bodySmall?.color,
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          }),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "MAG",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
