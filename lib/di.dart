import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/data/repositories/cart_repository.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/data/services/auth_services/auth_service.dart';
import 'package:store_app/data/services/auth_services/i_auth_api_service.dart';
import 'package:store_app/data/services/cart_services/cart_service.dart';
import 'package:store_app/data/services/cart_services/i_cart_service.dart';
import 'package:store_app/data/services/product_services/i_product_service.dart';
import 'package:store_app/data/services/product_services/product_service.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:store_app/modules/cart/controllers/cart_controller.dart';
import 'package:store_app/modules/home/controllers/products_controller.dart';

final di = GetIt.instance;

Future<void> initServices() async {
  di.registerLazySingleton<IAuthApiService>(() => AuthService());
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepository(di<IAuthApiService>()));

  di.registerLazySingleton<IProductService>(() => ProductService());
  di.registerLazySingleton<ProductRepository>(
      () => ProductRepository(di<IProductService>()));

  di.registerLazySingleton<ICartService>(() => CartService());
  di.registerLazySingleton<CartRepository>(
      () => CartRepository(di<ICartService>()));

  // controllers
  Get.put<AuthController>(AuthController(di()));
  Get.put<ProductsController>(ProductsController(di<ProductRepository>()));
  Get.put<CartController>(CartController(di<CartRepository>()));
}
