import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/models/user.dart';
import 'package:mat_lgs/services/auth_base_service.dart';
import 'package:mat_lgs/services/fake_auth_service.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBaseService {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FakeAuthService _fakeAuthService = locator<FakeAuthService>();

  AppMode appMode = AppMode.DEBUG;
  @override
  Future<MyUser?> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.currentUser();
    } else {
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<bool> isSignOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.isSignOut();
    } else {
      return await _firebaseAuthService.isSignOut();
    }
  }

  @override
  Future<MyUser?> signInEmailPassword(String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInEmailPassword(email, password);
    } else {
      return await _firebaseAuthService.signInEmailPassword(email, password);
    }
  }
}
