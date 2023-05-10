import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';

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
        elevation: 0, //AppBar'ın arka planını beyaz yapar.
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
        ),
      ),
    );
  }

  Future resetPassword() async {
    debugPrint("Öncesi");
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
    debugPrint("Sonrası");
  }
}
