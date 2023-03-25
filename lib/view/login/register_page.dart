import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';
import 'package:mat_lgs/utilities/app_padding.dart';
import 'package:mat_lgs/view/login/login_page.dart';
import '../../component/container/login_text_container.dart';
import '../../component/list-tile/login_listtile.dart';
import '../../constants/app/app_constants.dart';
import '../../models/myuser.dart';
import '../home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final userName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
              color: Theme.of(context).iconTheme.color,
            );
          },
        ),
        title: Text(
          ApplicationConstants.registerTitle,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: _buildNickNameEmailPassword(context),
    );
  }

  _buildNickNameEmailPassword(BuildContext context) {
    return Padding(
        padding: AppPaddings.paddingSymetricH16V8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // LoginListTile(
              //   email: userName,
              //   prefixIcon: Icons.nest_cam_wired_stand,
              //   hintText: "Kullanıcı Adı",
              // ),
              // const LoginTextContainer(
              //   text: "Kullanıcı Adı",

              Form(
                key: formKey1,
                child: LoginListTile(
                  email: email,
                  // validator: ((value) =>
                  //     value != null && !EmailValidator.validate(value)
                  //         ? "Geçerli bir email giriniz !"
                  //         : null),
                  hintText: ApplicationConstants.ePosta,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email,
                ),
              ),
              const Padding(
                padding: AppPaddings.paddingSymetricV8,
                child: LoginTextContainer(text: ApplicationConstants.ePosta),
              ),
              Form(
                key: formKey2,
                child: LoginListTile(
                  email: password,
                  hintText: ApplicationConstants.password,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                ),
              ),
              const Padding(
                padding: AppPaddings.paddingSymetricV8,
                child: LoginTextContainer(text: ApplicationConstants.password),
              ),
              FlutterPwValidator(
                controller: password,
                minLength: 6,
                uppercaseCharCount: 1,
                numericCharCount: 2,
                //specialCharCount: 1,
                normalCharCount: 3,
                width: 400,
                height: 150,
                onSuccess: () {
                  return true;
                },
                onFail: () {
                  debugPrint("Eşleşmedi");
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
              const SizedBox(
                height: 8,
              ),
              LoginButton(
                  text: "Kayıt ol",
                  onPressed: () {
                    _register(email.text, password.text);
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
                                style:
                                    TextStyle(fontSize: 10, color: Colors.black, decoration: TextDecoration.underline),
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
        ));
  }

  _register(String email, String password) async {
    try {
      MyUser? myUser = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user)
          .then((value) => FirebaseAuthService().fromFirebasetoMyUser(value));
      if (myUser != null) {
        // Fluttertoast.showToast(msg: "Başarıyla kayıt oldunuz. Giriş ekranına yönlendiriliyorsunuz.");
        // const Duration(seconds: 3);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "Bu kullanıcı zaten kayıtlı!", gravity: ToastGravity.TOP);
      } else if (e.code == "invalid-email") {
        Fluttertoast.showToast(msg: "Geçersiz e-mail");
      }
    }
  }
}
