import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/modules/auth/views/widgets/loading_ddialog.dart';
import 'package:store_app/routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  // Current user
  final Rx<UserModel?> user = Rx<UserModel?>(null);

  // Loading state
  final RxBool isLoading = false.obs;

  // Error message
  final RxString error = "".obs;

  AuthController(this._authRepository);

  /// Sign in with Google
  Future<void> signInWithGoogle() async {
    try {
      _showLoadingDialog(); // Show loading dialog
      error.value = "";
      isLoading.value = true;

      // Perform Google Sign-In
      final result = await _authRepository.signInWithGoogle();
      result.fold(
        (_) {
          error.value = "Failed to sign in with Google.";
          _dismissLoadingDialog();
        },
        (userData) {
          user.value = userData;
          _dismissLoadingDialog();
          Get.offAllNamed(AppRoutes.home); // Navigate to home
        },
      );
    } catch (e) {
      error.value = "An unexpected error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  /// Sign out the user
  Future<void> signOut() async {
    try {
      isLoading.value = true;

      // Perform sign out
      await _authRepository.signOut();

      // Clear user state
      user.value = null;

      // Navigate to auth page
      Get.offAllNamed(AppRoutes.auth);
    } catch (e) {
      error.value = "Failed to sign out: $e";
    } finally {
      isLoading.value = false;
    }
  }

  /// Check if the user is authenticated
  Future<void> checkAuthentication() async {
    try {
      error.value = "";
      isLoading.value = true;

      // Check authentication status
      final result = await _authRepository.isAuthenticated();
      result.fold(
        (failure) {
          Get.offAllNamed(AppRoutes.auth); // Navigate to auth page
        },
        (userData) {
          user.value = userData;
          Get.offAllNamed(AppRoutes.home); // Navigate to home
        },
      );
    } catch (e) {
      error.value = "Error checking authentication: $e";
    } finally {
      isLoading.value = false;
    }
  }

  /// Show loading dialog
  void _showLoadingDialog() {
    if (Get.isDialogOpen != true) {
      loadingDialog();
    }
  }

  /// Dismiss loading dialog
  void _dismissLoadingDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkAuthentication(); // Check authentication when controller is ready
  }
}
