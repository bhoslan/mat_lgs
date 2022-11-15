import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/models/user.dart';
import 'auth_base_service.dart';

class FirebaseAuthService implements AuthBaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String errorMessage = "";

  MyUser? fromFirebasetoMyUser(User? user) {
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
      return fromFirebasetoMyUser(user);
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
  Future<dynamic> signInEmailPassword(email, password) async {
    try {
      User? user = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user);
      if(user!=null){return fromFirebasetoMyUser(user);} 
    } on FirebaseAuthException catch (e) {
      return errorMessage = e.message!;
    }
    
  }

  @override
  Future<void> signOut() async {
    try {
      _firebaseAuth.signOut();
      debugPrint("Firebaseden çıkış yapıldı.");
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthService HATA ! ${e.toString()}");
    }
  }

  @override
  Future register(email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw  Exception(e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
