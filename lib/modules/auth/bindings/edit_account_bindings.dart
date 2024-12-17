import 'package:get/get.dart';
import 'package:store_app/modules/auth/controllers/edit_account_controller.dart';

class EditAccountBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditAccountController(Get.find()));
  }
}