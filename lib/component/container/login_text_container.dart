import 'package:flutter/material.dart';

class LoginTextContainer extends StatelessWidget {
  final String? text;
  const LoginTextContainer({super.key,  this.text =" "});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
        color: Colors.white54,
        width: 400,
        height: 20,
        child:  Text(
          text!,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ));
  }
}
