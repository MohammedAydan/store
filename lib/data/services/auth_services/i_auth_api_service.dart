abstract class IAuthApiService {
  // create
  Future<dynamic> signInWithGoogle();

  // signOut
  Future<dynamic> signOut();

  // check is authenticated
  Future<dynamic> isAuthenticated();

  // update
  Future<dynamic> updateUser(dynamic userData);

  // delete
  Future<dynamic> deleteUser();
}
