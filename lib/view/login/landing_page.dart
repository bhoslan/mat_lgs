import 'package:flutter/material.dart';
import 'package:mat_lgs/view/home_page.dart';
import 'package:mat_lgs/view/login/login_page.dart';
import 'package:mat_lgs/viewmodels.dart/user_viewmodel.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userViewmodel = Provider.of<UserViewModel>(context);

    if (userViewmodel.state == ViewState.idle) {
      if (userViewmodel.myUser == null) {
        return const LoginPage();
      } else {
        return HomePage(
          
        );
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
