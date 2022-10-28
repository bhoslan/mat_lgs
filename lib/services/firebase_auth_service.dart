import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/models/user.dart';

import 'auth_base_service.dart';

class FirebaseAuthService implements AuthBaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyUser? _fromFirebasetoMyUser(User? user) {
    if (user == null) {
      return null;
    } else {
      return MyUser(myUserId: user.uid);
    }
  }

  @override
  Future<MyUser?> currentUser() async {
    try {
      final User? user = _firebaseAuth.currentUser;
      return _fromFirebasetoMyUser(user);
    } catch (e) {
      debugPrint("HATA! Current User : $e");
      return null;
    }
  }

  @override
  Future<bool> isSignOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("HATA! isSignOut $e");
      return false;
    }
  }

  @override
  Future<MyUser?> signInEmailPassword(email, password) async {
    User? user = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => value.user);
    return _fromFirebasetoMyUser(user);
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
    debugPrint("Firebaseden çıkış yapıldı.");
  }

  @override
  Future register(email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        print("Daha güçlü bir parola giriniz!");
      } else if (e.code == "email-already-in-use") {
        print("Bu mail adresi zaten kayıtlı!");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
