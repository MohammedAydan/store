import 'package:get/get.dart';
import 'package:store_app/modules/auth/bindings/auth_bindings.dart';
import 'package:store_app/modules/auth/views/pages/account_page.dart';
import 'package:store_app/modules/auth/views/pages/auth_page.dart';
import 'package:store_app/modules/auth/views/pages/splash_page.dart';
import 'package:store_app/modules/cart/bindings/cart_bindings.dart';
import 'package:store_app/modules/cart/views/pages/cart_page.dart';
import 'package:store_app/modules/home/bindings/search_bindings.dart';
import 'package:store_app/modules/home/views/pages/home_page.dart';
import 'package:store_app/modules/home/views/pages/product_show_page.dart';
import 'package:store_app/modules/home/views/pages/search_page.dart';
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
      name: AppRoutes.account,
      page: () => const AccountPage(),
      // binding: AccountBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      // binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => ProductShowPage(),
      // binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartPage(),
      binding: CartBindings(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchPage(),
      binding: SearchBindings(),
    ),
  ];
}
