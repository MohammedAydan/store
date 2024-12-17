import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/edit_account_controller.dart';

class EditAccountBottomNavBar extends StatelessWidget {
  const EditAccountBottomNavBar({
    super.key,
    required this.controller,
  });

  final EditAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  controller.editAccount();
                },
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
