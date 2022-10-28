// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
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
      debugPrint("Repository currentUser HATA !${e.toString()}");
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
      debugPrint("Repository isSignOut HATA !${e.toString()}");
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
      debugPrint("Repository signInEmailPassword HATA !${e.toString()}");
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      if (appMode == AppMode.DEBUG) {
        return await _fakeAuthService.signOut();
      } else {
        return await _firebaseAuthService.signOut();
      }
    } catch (e) {
      debugPrint("Repository signOut HATA !${e.toString()}");
    }
  }
  
  @override
  Future register(String email, String password) async{
    try {
      if (appMode == AppMode.DEBUG) {
        return await _fakeAuthService.register(email,password);
      } else {
        return await _firebaseAuthService.register(email,password);
      }
    } catch (e) {
      debugPrint("Repository signOut HATA !${e.toString()}");
    }
  }
}
