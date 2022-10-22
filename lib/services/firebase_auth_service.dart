import 'package:firebase_auth/firebase_auth.dart';
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
      print("HATA! Current User : $e");
      return null;
    }
  }

  @override
  Future<bool> isSignOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("HATA! isSignOut" + e.toString());
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
}
