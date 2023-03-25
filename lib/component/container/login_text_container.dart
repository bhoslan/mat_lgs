import 'package:flutter/material.dart';

class LoginTextContainer extends StatelessWidget {
  final String text;
  const LoginTextContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.grey.shade800),
      ),
    );
  }
}
/*
Container(
        margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
        width: 400,
        height: 20,
        child: Text(
          text ,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ))*/