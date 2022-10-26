import 'package:flutter/material.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/component/list-tile/login_listtile.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/view/login/register_page.dart';
import 'forgot_password_page.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          ApplicationConstants.LOGIN_TITLE,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, //AppBar'ın arka planını beyaz yapar.
      ),
      body: _buildEmailPassword(),
    );
  }

  Widget _buildEmailPassword() {
    return SingleChildScrollView(
      child: Column(
        children: [
          LoginListTile(
            email: email,
            hintText: "E-posta",
            iconColor: Colors.red,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
          ),
          const LoginTextContainer(
            text: "E-Posta",
          ),
          LoginListTile(
            email: password,
            hintText: "Şifre",
            iconColor: Colors.grey,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Şifre",
                    style: TextStyle(fontWeight: FontWeight.w400)),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: const Text("Şifremi unuttum",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          decorationThickness: 3,
                        )))
              ],
            ),
          ),
          LoginButton(text: "Giriş Yap", onPressed: () {}),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Hesabınız yok mu?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text("Kayıt ol",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }
}
