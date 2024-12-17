import 'package:store_app/data/models/user_model.dart';

abstract class IUserServiceForAdminManagement {
  Future<void> createUser(String email, String password);
  Future<void> deleteUser(String email);
  Future<void> updateUser(String email, String password);
  Future<void> resetPassword(String email);
  Future<void> changeEmail(String email);
  Future<void> changePassword(String password);
  Future<void> changeRole(String email, String role);
  Future<void> changeStatus(String email, String status);
  Future<void> changeName(String email, String name);
  Future<void> changePhone(String email, String phone);
  Future<void> changeAddress(String email, String address);
  Future<void> changeCity(String email, String city);
  Future<void> changeCountry(String email, String country);
  Future<void> changePhotoUrl(String email, String photoUrl);
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUserByEmail(String email);
  Future<UserModel> getUserById(String id);
  Future<List<UserModel>> getAllUsers({int page = 1, int limit = 10});
  Future<List<UserModel>> getAllUsersByRole(String role);
  Future<List<UserModel>> getAllUsersByStatus(String status);
  Future<List<UserModel>> getAllUsersByName(String name);
  Future<List<UserModel>> getAllUsersByEmail(String email);
  Future<List<UserModel>> getAllUsersByPhone(String phone);
  Future<List<UserModel>> getAllUsersByAddress(String address);
  Future<List<UserModel>> getAllUsersByCity(String city);
  Future<List<UserModel>> getAllUsersByCountry(String country);
}
