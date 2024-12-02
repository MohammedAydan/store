import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/images_constants.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImagesConstants.img1),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Store",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // create description
            const Text(
              "Welcome to Store, the best place to buy anything you want.",
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 4),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Get.theme.primaryColor,
                foregroundColor: Get.theme.colorScheme.onPrimary,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: controller.signInWithGoogle,
              child: const Text("Sign In With Google"),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
