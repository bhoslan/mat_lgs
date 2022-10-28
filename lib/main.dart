
import 'package:flutter/material.dart';
import 'package:mat_lgs/locator.dart';
import 'package:mat_lgs/view/login/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mat_lgs/viewmodels.dart/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserViewModel(),
      )
    ],
    child: const MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitirme Tezi',
      home: LandingPage(),
    );
  }
}
