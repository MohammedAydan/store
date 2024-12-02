import 'package:get/get.dart';
import 'package:store_app/data/repositories/user_repository.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(UserRepository()));
  }
}
