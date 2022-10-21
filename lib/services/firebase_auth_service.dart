import 'package:mat_lgs/models/user.dart';

import 'auth_base_service.dart';

class FirebaseAuthService implements AuthBaseService{
  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignOut() {
    // TODO: implement isSignOut
    throw UnimplementedError();
  }

  @override
  Future<User> signInEmail() {
    // TODO: implement signInEmail
    throw UnimplementedError();
  }
}