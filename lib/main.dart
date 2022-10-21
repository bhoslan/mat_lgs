import 'package:flutter/material.dart';
import 'package:mat_lgs/view/login/login_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitirme Tezi',
      home: LoginPage(),
    );
  }
}
