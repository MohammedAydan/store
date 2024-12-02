import 'package:get/get.dart';
import 'package:store_app/data/repositories/user_repository.dart';
import '../controllers/auth_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthController(UserRepository()));
  }
}
