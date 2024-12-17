import 'package:get/get.dart';
import 'package:store_app/modules/admin/views/pages/analytics_page.dart';
import 'package:store_app/modules/admin/views/pages/customers_page.dart';
import 'package:store_app/modules/admin/views/pages/d_products_page.dart';
import 'package:store_app/modules/admin/views/pages/dashboard_order_detalis_page.dart';
import 'package:store_app/modules/admin/views/pages/dashboard_orders_page.dart';
import 'package:store_app/modules/admin/views/pages/dashboard_page.dart';
import 'package:store_app/modules/admin/views/pages/inital_card_settings.dart';
import 'package:store_app/modules/admin/views/pages/settings_page.dart';
import 'package:store_app/modules/auth/bindings/auth_bindings.dart';
import 'package:store_app/modules/auth/bindings/edit_account_bindings.dart';
import 'package:store_app/modules/auth/views/pages/account_page.dart';
import 'package:store_app/modules/auth/views/pages/auth_page.dart';
import 'package:store_app/modules/auth/views/pages/edit_account_page.dart';
import 'package:store_app/modules/auth/views/pages/splash_page.dart';
import 'package:store_app/modules/cart/bindings/cart_bindings.dart';
import 'package:store_app/modules/cart/views/pages/cart_page.dart';
import 'package:store_app/modules/home/bindings/home_bindings.dart';
import 'package:store_app/modules/home/bindings/search_bindings.dart';
import 'package:store_app/modules/home/views/pages/home_page.dart';
import 'package:store_app/modules/home/views/pages/product_show_page.dart';
import 'package:store_app/modules/home/views/pages/search_page.dart';
import 'package:store_app/modules/orders/bindings/order_details_bindings.dart';
import 'package:store_app/modules/orders/bindings/orders_bindings.dart';
import 'package:store_app/modules/orders/views/pages/order_details_page.dart';
import 'package:store_app/modules/orders/views/pages/orders_page.dart';
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
      name: AppRoutes.editAccount,
      page: () => const EditAccountPage(),
      binding: EditAccountBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.product,
      page: () => ProductShowPage(),
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
    GetPage(
      name: AppRoutes.orders,
      page: () => const OrdersPage(),
      binding: OrdersBindings(),
    ),
    GetPage(
      name: AppRoutes.orderDetails,
      page: () => const OrderDetailsPage(),
      binding: OrderDetailsBindings(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: AppRoutes.dashboardOrders,
      page: () => const DashboardOrdersPage(),
    ),
    GetPage(
      transition: Transition.downToUp,
      name: AppRoutes.dashboardOrderDetails,
      page: () => const DashboardOrderDetailsPage(),
    ),
    GetPage(
      name: AppRoutes.dProducts,
      page: () => const DProductsPage(),
    ),
    GetPage(
      name: AppRoutes.customers,
      page: () => CustomersPage(),
    ),
    GetPage(
      name: AppRoutes.analytics,
      page: () => AnalyticsPage(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: AppRoutes.initalCards,
      page: () => InitialCardSettings(),
    ),
  ];
}
