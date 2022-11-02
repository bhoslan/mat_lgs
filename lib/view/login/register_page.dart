import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/viewmodels.dart/user_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../component/container/login_text_container.dart';
import '../../component/list-tile/login_listtile.dart';
import '../../models/user.dart';
import '../home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final UserViewModel userViewModel = Provider.of(context);

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
      body: _buildNickNameEmailPassword(context),
    );
  }

  _buildNickNameEmailPassword(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
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
          Form(
            key: formKey2,
            child: TextFormField(
              controller: email,
              decoration: const InputDecoration(
                hintText: "E-Posta",
                iconColor: Colors.red,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.red,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),

          const LoginTextContainer(
            text: "E-Posta",
          ),

          TextFormField(
            controller: password,
            decoration: const InputDecoration(
              hintText: "Şifre",
              iconColor: Colors.grey,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.grey,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
          ),
          const SizedBox(
            height: 10,
          ),
          FlutterPwValidator(
            controller: password,
            minLength: 8,
            uppercaseCharCount: 1,
            numericCharCount: 2,
            specialCharCount: 1,
            normalCharCount: 3,
            width: 400,
            height: 150,
            onSuccess: () {
              print("MATCHED");
              ScaffoldMessenger.of(context).showSnackBar(
                  new SnackBar(content: new Text("Password is matched")));
            },
            onFail: () {
              print("NOT MATCHED");
            },
          ),

          // LoginListTile(
          //   email: password,
          //   hintText: "Şifre",
          //   iconColor: Colors.grey,
          //   keyboardType: TextInputType.visiblePassword,
          //   prefixIcon: Icons.lock_outline,
          //   obscureText: true,
          // ),

          LoginButton(
              text: "Kayıt ol",
              onPressed: () async {
                MyUser? myUser =
                    await Provider.of<UserViewModel>(context, listen: false)
                        .register(email.text, password.text);
                if (myUser != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(myUser: myUser),
                      ));
                }
              }),
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
