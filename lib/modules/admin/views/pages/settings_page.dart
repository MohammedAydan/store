import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/admin/views/pages/inital_card_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          // ListTile(
          //   onTap: () {
          //     Get.to(() => InitialCardSettings());
          //   },
          //   leading: const Icon(Icons.view_carousel_rounded),
          //   title: const Text("Manage inital cards"),
          // ),
        ],
      ),
    );
  }
}
