import 'package:flutter/material.dart';
import 'package:store_app/modules/home/views/widgets/custom_app_bar.dart';
import 'package:store_app/modules/home/views/widgets/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          HomeContent(),
        ],
      ),
    );
  }
}
