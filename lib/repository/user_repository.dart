// ignore_for_file: constant_identifier_names

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

  AppMode appMode = AppMode.RELEASE;
  @override
  Future<MyUser?> currentUser() async {
    try {
      if (appMode == AppMode.DEBUG) {
        return await _fakeAuthService.currentUser();
      } else {
        return await _firebaseAuthService.currentUser();
      }
    } catch (e) {
      print("Repository currentUser HATA !${e.toString()}");
      return null;
    }
  }

  @override
  Future<bool> isSignOut() async {
    try {
      if (appMode == AppMode.DEBUG) {
        return await _fakeAuthService.isSignOut();
      } else {
        return await _firebaseAuthService.isSignOut();
      }
    } catch (e) {
      print("Repository isSignOut HATA !${e.toString()}");
      return false;
    }
  }

  @override
  Future<MyUser?> signInEmailPassword(String email, String password) async {
    try {
      if (appMode == AppMode.DEBUG) {
        return await _fakeAuthService.signInEmailPassword(email, password);
      } else {
        return await _firebaseAuthService.signInEmailPassword(email, password);
      }
    } catch (e) {
      print("Repository signInEmailPassword HATA !${e.toString()}");
      return null;
    }
  }
}
