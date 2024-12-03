import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:store_app/modules/auth/views/widgets/user_filed.dart';

class AccountPage extends GetView<AuthController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.signOut();
            },
          ),
        ],
      ),
      body: Obx(() {
        print(controller.user.toJson());
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.user.value == null) {
          return const Center(child: Text('No user logged in'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    child: Text(
                      "${controller.user.value?.name[0].toUpperCase()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                UserFiled(name: "Name", data: controller.user.value?.name),
                const SizedBox(height: 10),
                UserFiled(name: "Email", data: controller.user.value?.email),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to edit profile page
                  },
                  child: const Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to change password page
                  },
                  child: const Text('Change Password'),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
