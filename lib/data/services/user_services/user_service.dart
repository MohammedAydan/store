import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/services/user_services/i_user_service.dart';

class UserService implements IUserServiceForAdminManagement {
  @override
  Future<void> changeAddress(String email, String address) {
    // TODO: implement changeAddress
    throw UnimplementedError();
  }

  @override
  Future<void> changeCity(String email, String city) {
    // TODO: implement changeCity
    throw UnimplementedError();
  }

  @override
  Future<void> changeCountry(String email, String country) {
    // TODO: implement changeCountry
    throw UnimplementedError();
  }

  @override
  Future<void> changeEmail(String email) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  Future<void> changeName(String email, String name) {
    // TODO: implement changeName
    throw UnimplementedError();
  }

  @override
  Future<void> changePassword(String password) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<void> changePhone(String email, String phone) {
    // TODO: implement changePhone
    throw UnimplementedError();
  }

  @override
  Future<void> changePhotoUrl(String email, String photoUrl) {
    // TODO: implement changePhotoUrl
    throw UnimplementedError();
  }

  @override
  Future<void> changeRole(String email, String role) {
    // TODO: implement changeRole
    throw UnimplementedError();
  }

  @override
  Future<void> changeStatus(String email, String status) {
    // TODO: implement changeStatus
    throw UnimplementedError();
  }

  @override
  Future<void> createUser(String email, String password) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String email) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsers({int page = 1, int limit = 10}) {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByAddress(String address) {
    // TODO: implement getAllUsersByAddress
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByCity(String city) {
    // TODO: implement getAllUsersByCity
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByCountry(String country) {
    // TODO: implement getAllUsersByCountry
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByEmail(String email) {
    // TODO: implement getAllUsersByEmail
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByName(String name) {
    // TODO: implement getAllUsersByName
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByPhone(String phone) {
    // TODO: implement getAllUsersByPhone
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByRole(String role) {
    // TODO: implement getAllUsersByRole
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAllUsersByStatus(String status) {
    // TODO: implement getAllUsersByStatus
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserByEmail(String email) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(String email, String password) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
