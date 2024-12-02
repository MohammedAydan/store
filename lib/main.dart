import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/bindings/global_bindings.dart';
import 'package:store_app/routes/app_pages.dart';
import 'package:store_app/routes/app_routes.dart';
import 'package:store_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      initialBinding: GlobalBindings(),
    );
  }
}
