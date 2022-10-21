import '../models/user.dart';

abstract class AuthBaseService {
  Future<User> currentUser();
  Future<User> signInEmail();
  Future<bool> isSignOut();
}
