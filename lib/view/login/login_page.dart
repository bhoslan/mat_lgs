import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mat_lgs/component/button/login_buttons.dart';
import 'package:mat_lgs/component/container/login_text_container.dart';
import 'package:mat_lgs/component/list-tile/login_listtile.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';
import 'package:mat_lgs/utilities/app_padding.dart';
import 'package:mat_lgs/view/home_page.dart';
import 'package:mat_lgs/view/login/register_page.dart';
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
          ApplicationConstants.loginTitle,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: _buildEmailPassword(context),
    );
  }

  Widget _buildEmailPassword(BuildContext context) {
    final FocusNode focusNodeTextFieldOne = FocusNode();
    final FocusNode focusNodeTextFieldTwo = FocusNode();

    return Padding(
      padding: AppPaddings.paddingAll16,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Form(
              key: formKey1,
              child: LoginListTile(
                focusnode: focusNodeTextFieldOne,
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
                focusnode: focusNodeTextFieldTwo,
                email: password,
                hintText: ApplicationConstants.password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock_outline,
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ApplicationConstants.password,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey.shade800),
                ),
                const _ButtonForgotPassword(),
              ],
            ),
            Padding(
              padding: AppPaddings.paddingSymetricV8,
              child: LoginButton(
                text: ApplicationConstants.login,
                onPressed: () {
                  _login(email.text, password.text);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ApplicationConstants.isHaveAccount,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey.shade800),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      ApplicationConstants.registerTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(decoration: TextDecoration.underline, color: Colors.blue),
                    )),
              ],
            ),
          ],
        ),
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
            builder: (context) => HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "Yanlış şifre!", gravity: ToastGravity.TOP);
      } else if (e.code == "invalid-email") {
        Fluttertoast.showToast(msg: "Geçersiz e-mail !", gravity: ToastGravity.TOP);
      } else if (e.code == "user-not-found") {
        Fluttertoast.showToast(msg: "Geçersiz e-mail ya da şifre !", gravity: ToastGravity.TOP);
      }
    }
  }
}

class _ButtonForgotPassword extends StatelessWidget {
  const _ButtonForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        ApplicationConstants.forgotPasswordTitle,
        style:
            Theme.of(context).textTheme.bodyText2?.copyWith(decoration: TextDecoration.underline, color: Colors.blue),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
        );
      },
    );
  }
}
