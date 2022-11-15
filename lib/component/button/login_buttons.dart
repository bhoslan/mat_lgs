import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const LoginButton({super.key, required this.text, required this.onPressed});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
