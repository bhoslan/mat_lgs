import 'package:firebase_auth/firebase_auth.dart';
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
  final email = TextEditingController();

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
          TextField(
            controller: email,
            decoration: const InputDecoration(
              hintText: "E-mail",
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const LoginTextContainer(
            text: "E-mail",
          ),
          LoginButton(
              text: "Şifreyi Sıfırla",
              onPressed: () async {
                //try {
                //     await _auth.sendPasswordResetEmail(email: email.text);
                //   } on FirebaseAuthException catch (e) {
                //     if (e.code == "invalid-email") {
                //       Fluttertoast.showToast(
                //           msg: "Geçersiz e-mail !",
                //           gravity: ToastGravity.TOP);
                //     }
                //     if (e.code == "user-not-found") {
                //       Fluttertoast.showToast(
                //           msg: "Böyle bir kullanıcı bulunamadı ",
                //           gravity: ToastGravity.TOP);
                //     }
                //   }
                // })
                resetPassword();
              })
        ],
      ),
    );
  }

  Future resetPassword() async {
    debugPrint("Öncesi");
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text.trim());
    debugPrint("Sonrası");
  }
}
