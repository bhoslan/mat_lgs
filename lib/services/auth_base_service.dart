import '../models/myuser.dart';

abstract class AuthBaseService {
  Future<MyUser?> currentUser();
  Future<dynamic> signInEmailPassword(String email, String password);
  Future<bool> isSignOut();
  Future<void> signOut();
  Future register(String email, String password);
}
