import 'package:mat_lgs/models/user.dart';
import 'package:mat_lgs/services/auth_base_service.dart';

class FakeAuthService implements AuthBaseService {
  String userId = "12asdvgr14r5df4d3";

  @override
  Future<MyUser> currentUser() async {
    return MyUser(myUserId: userId);
  }

  @override
  Future<bool> isSignOut() {
    return Future.value(true);
  }

  @override
  Future<MyUser> signInEmailPassword(email, password) async {
    return Future.delayed(const Duration(seconds: 2), () {
      return MyUser(myUserId: userId);
    });
  }
}
