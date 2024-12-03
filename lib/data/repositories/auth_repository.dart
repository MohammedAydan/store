import 'package:dartz/dartz.dart';
import 'package:store_app/data/models/user_model.dart';
import 'package:store_app/data/services/auth_services/i_auth_api_service.dart';

class AuthRepository {
  final IAuthApiService _authApiService;

  AuthRepository(this._authApiService);

  Future<Either<Unit, UserModel>> signInWithGoogle() async {
    final res = await _authApiService.signInWithGoogle();
    if (res == null) {
      return const Left(unit);
    }
    return Right(UserModel.fromJson(res));
  }

  Future<UserModel> signOut() async {
    final res = await _authApiService.signOut();
    return UserModel.fromJson(res);
  }

  Future<Either<Unit, UserModel>> isAuthenticated() async {
    final res = await _authApiService.isAuthenticated();
    if (res == null) {
      return const Left(unit);
    } else {
      return Right(UserModel.fromJson(res));
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    final res = await _authApiService.updateUser(user.toJson());
    return UserModel.fromJson(res);
  }

  Future<UserModel> deleteUser() async {
    final res = await _authApiService.deleteUser();
    return UserModel.fromJson(res);
  }
}
