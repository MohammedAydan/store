import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/modules/auth/controllers/auth_controller.dart';
import 'package:store_app/utils/egypt_cities_en.dart';

class EditAccountController extends GetxController {
  final AuthController _authController;
  final List<String> cities = egyptCitiesEn;

  EditAccountController(this._authController);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final RxString error = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Populate fields with the current user data
    usernameController.text = _authController.user.value?.name ?? '';
    emailController.text = _authController.user.value?.email ?? '';
    phoneNumberController.text = _authController.user.value?.phoneNumber ?? '';
    cityController.text = _authController.user.value?.city ?? '';
    addressController.text = _authController.user.value?.address ?? '';
  }

  void editAccount() async {
    try {
      error.value = "";
      if (formKey.currentState?.validate() == false) {
        return;
      }

      await _authController.updateUser(
        UserModel(
          name: usernameController.text.trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          city: cityController.text.trim(),
          address: addressController.text.trim(),
        ),
      );

      Get.back();
    } catch (e) {
      error.value = "An unexpected error occurred: $e";
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
