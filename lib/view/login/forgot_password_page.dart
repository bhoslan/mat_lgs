import 'package:flutter/material.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/component/list-tile/login_listtile.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});
  String title = "Şifremi Unuttum";
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
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
          LoginButton(text: "Şifreyi Sıfırla", onPressed: () {
            
          })
        ],
      ),
    );
  }
}
