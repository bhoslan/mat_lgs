import 'package:flutter/material.dart';
import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/services/firebase_auth_service.dart';
import 'package:mat_lgs/view/login/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLocator();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitirme Tezi',
      home: LandingPage(),
    );
  }
}
