import 'package:flutter/material.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class AccountBottomNavBar extends StatelessWidget {
  const AccountBottomNavBar({
    super.key,
    required this.controller,
  });

  final AuthController controller;

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
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  controller.signOut();
                },
                child: const Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
