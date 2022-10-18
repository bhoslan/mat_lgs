import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';

import '../../component/container/login_text_container.dart';
import '../../component/list-tile/login_listtile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userName = TextEditingController();
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
        title: const Text(
          "Kayıt ol",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "OpenSans",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: _buildNickNameEmailPassword(),
    );
  }

  _buildNickNameEmailPassword() {
    return SingleChildScrollView(
      child: Column(
        children: [
          LoginListTile(
            email: userName,
            prefixIcon: Icons.nest_cam_wired_stand,
            hintText: "Kullanıcı Adı",
          ),
          const LoginTextContainer(
            text: "Kullanıcı Adı",
          ),
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
            hintText: "şifre",
            iconColor: Colors.grey,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock_outline,
            obscureText: true,
          ),
          LoginButton(text: "Kayıt ol", onPressed: () {}),
          Container(
            margin: const EdgeInsets.only(left: 60, right: 60),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: 'Kayıt olarak, ',
                  style: const TextStyle(fontSize: 10, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Kullanım Koşullarını',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // code to open / launch terms of service link here
                          }),
                    const TextSpan(
                        text: ' ve ',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Gizlilik Politikasını',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                          TextSpan(
                            text: ' kabul etmiş olursunuz. ',
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
