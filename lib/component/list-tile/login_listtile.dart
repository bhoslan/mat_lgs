import 'package:flutter/material.dart';
import 'package:mat_lgs/utilities/app_colors.dart';

class LoginListTile extends StatefulWidget {
  final TextEditingController? email;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final Color? iconColor;
  final String? hintText;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;
  final FormFieldValidator<String?>? validator;
  final FocusNode? focusnode;

  const LoginListTile(
      {super.key,
      this.email,
      this.keyboardType,
      this.prefixIcon,
      this.iconColor,
      this.hintText,
      this.obscureText = false,
      this.onSubmitted,
      this.errorText,
      this.validator,
      this.focusnode});

  @override
  State<LoginListTile> createState() => _LoginListTileState();
}

class _LoginListTileState extends State<LoginListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TextField(
        style: TextStyle(color: ApplicationColors.appBarbackGroundColor),
        focusNode: widget.focusnode,
        //validator: widget.validator,
        controller: widget.email,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              color: widget.iconColor,
            ),
            errorText: widget.errorText,
            hintText: widget.hintText),
        obscureText: widget.obscureText,
      ),
    );
  }
}
