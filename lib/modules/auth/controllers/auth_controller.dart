import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/repositories/user_repository.dart';
import 'package:store_app/modules/auth/views/widgets/loading_ddialog.dart';
import 'package:store_app/routes/app_routes.dart';

class AuthController extends GetxController {
  final UserRepository _userRepository;
  Rx<UserModel>? user;
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;

  AuthController(this._userRepository);

  Future<void> signInWithGoogle() async {
    try {
      loadingDialog();
      error.value = "";
      isLoading.value = true;
      final res = await _userRepository.signInWithGoogle();
      res.fold(
        (_) {
          error.value = "Error in sign in with google";
          Get.back();
        },
        (userData) {
          user?.value = userData;
          Get.back();
          Get.offAllNamed(AppRoutes.home);
        },
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await _userRepository.signOut();
      Get.offAllNamed(AppRoutes.auth);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> isAuthanticated() async {
    try {
      error.value = "";
      isLoading.value = true;
      final res = await _userRepository.isAuthanticated();
      res.fold(
        (_) {
          Get.offAllNamed(AppRoutes.auth);
        },
        (userData) {
          print(userData.toJson());
          user?.value = userData;
          Get.offAllNamed(AppRoutes.home);
        },
      );
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    isAuthanticated();
  }
}
