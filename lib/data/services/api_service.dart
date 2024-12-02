import 'package:store_app/data/models/user_model.dart';

class ApiService {
  // create
  static Future<dynamic> signInWithGoogle() async {
    // logic
    await Future.delayed(const Duration(seconds: 3));
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // signOut
  static Future<dynamic> signOut() async {
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // check is authanticated
  static Future<dynamic> isAuthanticated() async {
    // logic
    return null;
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // update
  static Future<dynamic> updateUser() async {
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }

  // delete
  static Future<dynamic> deleteUser() async {
    // logic
    return UserModel(
      id: "65844",
      name: "Mohamed Aydan",
      email: "mohammedaydan12@gmail.com",
    ).toJson();
  }
}
