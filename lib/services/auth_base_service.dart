import '../models/user.dart';

abstract class AuthBaseService {
  Future<MyUser?> currentUser();
  Future<MyUser?> signInEmailPassword(String email, String password);
  Future<bool> isSignOut();
  Future<void> signOut();
  Future register(String email, String password);
}
