import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/services/auth_services/i_auth_api_service.dart';

class AuthService implements IAuthApiService {
  // create
  @override
  Future<dynamic> signInWithGoogle() async {
    // logic
    await Future.delayed(const Duration(seconds: 3));
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // signOut
  @override
  Future<dynamic> signOut() async {
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // check is authanticated
  @override
  Future<dynamic> isAuthenticated() async {
    // logic
    return null;
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // update
  @override
  Future<dynamic> updateUser(dynamic userData) async {
    await Future.delayed(const Duration(seconds: 2));
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // delete
  @override
  Future<dynamic> deleteUser() async {
    await Future.delayed(const Duration(seconds: 2));
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }
}
