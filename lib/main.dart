import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
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

class ProjectColors {
  static const Color appBarbackGround = Colors.transparent;
  static const Color title = Colors.transparent;
}

class FontFamily {
  static const String titleFontFamily = "OpenSans";
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
          ),
          centerTitle: true,
          backgroundColor: ProjectColors.appBarbackGround,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.titleFontFamily,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: ProjectColors.title,
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      title: ApplicationConstants.pendingTitle,
      home: const LandingPage(),
    );
  }
}
