import '../models/user.dart';

abstract class AuthBaseService {
  Future<MyUser?> currentUser();
  Future<MyUser?> signInEmailPassword(String email, String password);
  Future<bool> isSignOut();
}
