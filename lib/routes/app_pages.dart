import 'package:get/get.dart';
import 'package:store_app/modules/auth/bindings/auth_bindings.dart';
import 'package:store_app/modules/auth/views/pages/auth_page.dart';
import 'package:store_app/modules/auth/views/pages/splash_page.dart';
import 'package:store_app/modules/home/views/pages/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthPage(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      // binding: HomeBindings(),
    ),
  ];
}
