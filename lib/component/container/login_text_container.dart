import 'package:flutter/material.dart';
import 'package:mat_lgs/utilities/app_styles.dart';

class LoginTextContainer extends StatelessWidget {
  final String text;
  const LoginTextContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppStyles.labelStyle(context),
      ),
    );
  }
}
