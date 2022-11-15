import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/component/list-tile/login_listtile.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';
import 'package:mat_lgs/view/home_page.dart';
import 'package:mat_lgs/view/login/register_page.dart';
import 'package:mat_lgs/viewmodels.dart/user_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import 'forgot_password_page.dart';

void main() => runApp(const LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          ApplicationConstants.LOGIN_TITLE,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: _buildEmailPassword(context),
    );
  }

  Widget _buildEmailPassword(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: formKey1,
            child: LoginListTile(
              email: email,
              // validator: ((value) =>
              //     value != null && !EmailValidator.validate(value)
              //         ? "Geçerli bir email giriniz !"
              //         : null),
              hintText: "E-posta",
              iconColor: Colors.red,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
            ),
          ),
          const LoginTextContainer(
            text: "E-Posta",
          ),
          Form(
            key: formKey2,
            child: LoginListTile(
              email: password,
              hintText: "Şifre",
              iconColor: Colors.grey,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
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
                  child: const Text(
                    "Şifremi unuttum",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                      decorationThickness: 3,
                    ),
                  ),
                )
              ],
            ),
          ),
          LoginButton(
            text: "Giriş Yap",
            onPressed: () {
              _login(email.text, password.text);
            },
          ),
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
                            builder: (BuildContext context) =>
                                const RegisterPage()),
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

  _login(String email, String password) async {
    try {
      var myUser = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user)
          .then((value) => FirebaseAuthService().fromFirebasetoMyUser(value));

      //   MyUser? myUser = await Provider.of<UserViewModel>(context,listen: false)
      //       .signInEmailPassword(email, password);
      if (myUser != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(myUser: myUser),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "Yanlış şifre!", gravity: ToastGravity.TOP);
      } else if (e.code == "invalid-email") {
        Fluttertoast.showToast(
            msg: "Geçersiz e-mail !", gravity: ToastGravity.TOP);
      } else if (e.code == "user-not-found") {
        Fluttertoast.showToast(
            msg: "Geçersiz e-mail ya da şifre !", gravity: ToastGravity.TOP);
      }
    }
  }
}
