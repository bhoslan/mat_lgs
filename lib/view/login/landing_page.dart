import 'package:flutter/material.dart';
import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/services/auth_base_service.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';
import 'package:mat_lgs/view/login/login_page.dart';
import 'package:mat_lgs/view/login/register_page.dart';
import '../../models/user.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthBaseService authService = locator<FirebaseAuthService>();

  MyUser? user;
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const RegisterPage();
    } else {
      return const LoginPage();
    }
  }

  Future<MyUser?> _checkUser() async {
    MyUser? myUser = await authService.currentUser();
    if (myUser != null) {
      setState(() {
        user = myUser;
      });
      return user;
    } else {
      return null;
    }
  }
}
