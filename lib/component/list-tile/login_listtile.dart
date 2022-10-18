import 'package:flutter/material.dart';

class LoginListTile extends StatefulWidget {
  final TextEditingController? email;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final Color? iconColor;
  final String? hintText;
  final bool obscureText;
  const LoginListTile(
      {super.key,
      this.email,
      this.keyboardType,
      this.prefixIcon,
      this.iconColor,
      this.hintText,
      this.obscureText = false});

  @override
  State<LoginListTile> createState() => _LoginListTileState();
}

class _LoginListTileState extends State<LoginListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: widget.email,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              color: widget.iconColor,
            ),
            hintText: widget.hintText),
        obscureText: widget.obscureText,
      ),
    );
  }
}
