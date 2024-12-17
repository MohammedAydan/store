import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/data/repositories/cart_repository.dart';
import 'package:store_app/data/repositories/inital_card_repository.dart';
import 'package:store_app/data/repositories/location_repository.dart';
import 'package:store_app/data/repositories/product_repository.dart';
import 'package:store_app/data/repositories/order_repository.dart';
import 'package:store_app/data/repositories/user_repository.dart';
import 'package:store_app/data/services/auth_services/auth_service.dart';
import 'package:store_app/data/services/auth_services/i_auth_api_service.dart';
import 'package:store_app/data/services/cart_services/cart_service.dart';
import 'package:store_app/data/services/cart_services/i_cart_service.dart';
import 'package:store_app/data/services/inital_card/i_inital_card_service.dart';
import 'package:store_app/data/services/inital_card/inital_card_service.dart';
import 'package:store_app/data/services/location_services/i_location_service.dart';
import 'package:store_app/data/services/location_services/location_service.dart';
import 'package:store_app/data/services/product_services/i_product_service.dart';
import 'package:store_app/data/services/product_services/product_service.dart';
import 'package:store_app/data/services/tracking_services/i_order_service.dart';
import 'package:store_app/data/services/tracking_services/order_service.dart';
import 'package:store_app/data/services/user_services/i_user_service.dart';
import 'package:store_app/data/services/user_services/user_service.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/modules/orders/controllers/orders_controller.dart';

final di = GetIt.instance;

Future<void> initServices() async {
  //
  // Services
  di.registerSingleton<Dio>(Dio());
  GetStorage.init();
  di.registerSingleton(GetStorage());
  //
  di.registerLazySingleton<IAuthApiService>(() => AuthService());
  di.registerLazySingleton<AuthRepository>(
      () => AuthRepository(di<IAuthApiService>()));

  di.registerLazySingleton<IProductService>(() => ProductService());
  di.registerLazySingleton<ProductRepository>(
      () => ProductRepository(di<IProductService>()));

  di.registerLazySingleton<ICartService>(() => CartService());
  di.registerLazySingleton<CartRepository>(
      () => CartRepository(di<ICartService>()));

  di.registerLazySingleton<IInitalCardService>(() => InitalCardService());
  di.registerLazySingleton(() => InitalCardRepository(di()));

  di.registerLazySingleton<ILocationService>(() => LocationService(di()));
  di.registerLazySingleton(() => LocationRepository(di()));

  di.registerLazySingleton<IOrderService>(() => OrderService());
  di.registerLazySingleton(() => OrderRepository(di()));

  di.registerLazySingleton<IUserServiceForAdminManagement>(() => UserService());
  di.registerLazySingleton(() => UserRepository(di()));

  // controllers
  Get.put<AuthController>(AuthController(di()));
  Get.put(OrdersController(di(),Get.find()));
}
