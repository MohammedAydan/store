import 'package:dartz/dartz.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/services/api_service.dart';

class UserRepository {
  Future<Either<Unit, UserModel>> signInWithGoogle() async {
    final res = await ApiService.signInWithGoogle();
    if (res == null) {
      return const Left(unit);
    }
    return Right(UserModel.fromJson(res));
  }

  Future<UserModel> signOut() async {
    final res = await ApiService.signOut();
    return UserModel.fromJson(res);
  }

  Future<Either<Unit, UserModel>> isAuthanticated() async {
    final res = await ApiService.isAuthanticated();
    if (res == null) {
      return const Left(unit);
    } else {
      return Right(UserModel.fromJson(res));
    }
  }

  Future<UserModel> updateUser() async {
    final res = await ApiService.updateUser();
    return UserModel.fromJson(res);
  }

  Future<UserModel> deleteUser() async {
    final res = await ApiService.deleteUser();
    return UserModel.fromJson(res);
  }
}
