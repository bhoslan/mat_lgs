import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle? setTitleStyle(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge!;
    return titleStyle;
  }

  static TextStyle? labelStyle(BuildContext context) {
    TextStyle? labelStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800);
    return labelStyle;
  }

  static TextStyle? linkedUnderlineLabelStyle(BuildContext context) {
    TextStyle? linkedUnderlineLabelStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: Colors.blue);
    return linkedUnderlineLabelStyle;
  }

  static Color? buttonColorAmber = Colors.amber;
}
