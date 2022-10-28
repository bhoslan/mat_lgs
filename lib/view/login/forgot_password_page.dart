import 'package:flutter/material.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/component/list-tile/login_listtile.dart';
import '../../locator.dart';
import '../../services/auth_base_service.dart';
import '../../services/firebase_auth_service.dart';


class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});
  String title = "Şifremi Unuttum";
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  AuthBaseService authService = locator<FirebaseAuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
            );
          },
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, //AppBar'ın arka planını beyaz yapar.
      ),
      body: Column(
        children: [
          const LoginListTile(
            hintText: "E-mail",
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const LoginTextContainer(
            text: "E-mail",
          ),
          LoginButton(text: "Şifreyi Sıfırla", onPressed: () {})
        ],
      ),
    );
  }
}
