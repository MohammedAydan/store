import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/modules/auth/views/widgets/loading_ddialog.dart';
import 'package:store_app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxString error = "".obs;

  AuthController(this._authRepository);

  Future<void> signInWithGoogle() async {
    try {
      _showLoadingDialog();
      error.value = "";
      isLoading.value = true;

      final result = await _authRepository.signInWithGoogle();
      result.fold(
        (_) {
          error.value = "Failed to sign in with Google.";
          _dismissLoadingDialog();
        },
        (userData) {
          user.value = userData;
          _dismissLoadingDialog();
          Get.offAllNamed(AppRoutes.home);
        },
      );
    } catch (e) {
      error.value = "An unexpected error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      // isLoading.value = true;
      _showLoadingDialog();
      error.value = "";
      await _authRepository.signOut();
      user.value = null;
      _dismissLoadingDialog();
      Get.offAllNamed(AppRoutes.auth);
    } catch (e) {
      error.value = "Failed to sign out: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkAuthentication() async {
    try {
      error.value = "";
      isLoading.value = true;

      final result = await _authRepository.isAuthenticated();
      result.fold(
        (_) {
          Get.offAllNamed(AppRoutes.auth);
        },
        (userData) {
          user.value = userData;
          Get.offAllNamed(AppRoutes.home);
        },
      );
    } catch (e) {
      error.value = "Error checking authentication: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future updateUser(UserModel userData) async {
    try {
      _showLoadingDialog();
      error.value = "";
      isLoading.value = true;
      userData.id = user.value?.id;
      final result = await _authRepository.updateUser(userData);
      user.value = userData;
      _dismissLoadingDialog();
    } catch (e) {
      // error.value = "Failed to update user.";
      error.value = "An unexpected error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void _showLoadingDialog() {
    if (Get.isDialogOpen != true) {
      loadingDialog();
    }
  }

  void _dismissLoadingDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkAuthentication();
  }
}
