import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/services/user_services/i_user_service.dart';

class UserRepository {
  final IUserServiceForAdminManagement _userService;

  UserRepository(this._userService);

  Future<void> createUser(String email, String password) async {
    await _userService.createUser(email, password);
  }

  Future<void> deleteUser(String email) async {
    await _userService.deleteUser(email);
  }

  Future<void> updateUser(String email, String password) async {
    await _userService.updateUser(email, password);
  }

  Future<void> resetPassword(String email) async {
    await _userService.resetPassword(email);
  }

  Future<void> changeEmail(String email) async {
    await _userService.changeEmail(email);
  }

  Future<void> changePassword(String password) async {
    await _userService.changePassword(password);
  }

  Future<void> changeRole(String email, String role) async {
    await _userService.changeRole(email, role);
  }

  Future<void> changeStatus(String email, String status) async {
    await _userService.changeStatus(email, status);
  }

  Future<void> changeName(String email, String name) async {
    await _userService.changeName(email, name);
  }

  Future<void> changePhone(String email, String phone) async {
    await _userService.changePhone(email, phone);
  }

  Future<void> changeAddress(String email, String address) async {
    await _userService.changeAddress(email, address);
  }

  Future<void> changeCity(String email, String city) async {
    await _userService.changeCity(email, city);
  }

  Future<void> changeCountry(String email, String country) async {
    await _userService.changeCountry(email, country);
  }

  Future<void> changePhotoUrl(String email, String photoUrl) async {
    await _userService.changePhotoUrl(email, photoUrl);
  }

  Future<List<UserModel>> getUsers() async {
    return await _userService.getUsers();
  }

  Future<UserModel> getUserByEmail(String email) async {
    return await _userService.getUserByEmail(email);
  }

  Future<UserModel> getUserById(String id) async {
    return await _userService.getUserById(id);
  }

  Future<List<UserModel>> getAllUsers({int page = 1, int limit = 10}) async {
    return await _userService.getAllUsers(page: page, limit: limit);
  }

  Future<List<UserModel>> getAllUsersByRole(String role) async {
    return await _userService.getAllUsersByRole(role);
  }

  Future<List<UserModel>> getAllUsersByStatus(String status) async {
    return await _userService.getAllUsersByStatus(status);
  }

  Future<List<UserModel>> getAllUsersByName(String name) async {
    return await _userService.getAllUsersByName(name);
  }

  Future<List<UserModel>> getAllUsersByEmail(String email) async {
    return await _userService.getAllUsersByEmail(email);
  }

  Future<List<UserModel>> getAllUsersByPhone(String phone) async {
    return await _userService.getAllUsersByPhone(phone);
  }

  Future<List<UserModel>> getAllUsersByAddress(String address) async {
    return await _userService.getAllUsersByAddress(address);
  }

  Future<List<UserModel>> getAllUsersByCity(String city) async {
    return await _userService.getAllUsersByCity(city);
  }

  Future<List<UserModel>> getAllUsersByCountry(String country) async {
    return await _userService.getAllUsersByCountry(country);
  }
}
