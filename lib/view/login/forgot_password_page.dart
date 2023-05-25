import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/view/login/login_page.dart';

import '../../constants/app/app_constants.dart';
import '../../utilities/app_padding.dart';

// ignore: must_be_immutable
class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});
  String title = "Şifremi Unuttum";
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void navigateLoginPage() {
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
    }

    int waitingTimeToLoginPage = 5;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text(
          ApplicationConstants.forgotPasswordTitle,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const Padding(
                padding: AppPaddings.paddingSymetricV8,
                child: LoginTextContainer(text: ApplicationConstants.ePosta),
              ),
              LoginButton(
                  text: "Şifreyi Sıfırla",
                  onPressed: () async {
                    if (await resetPassword()) {
                      Fluttertoast.showToast(
                          msg: "Şifre sıfırlama maili başarıyla gönderildi! \n Giriş ekranına yönlendiriliyorsunuz!",
                          gravity: ToastGravity.TOP);
                      await Future.delayed(Duration(seconds: waitingTimeToLoginPage));
                      navigateLoginPage();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.toString(), gravity: ToastGravity.TOP);
      return false;
    }
    return true;
  }
}
