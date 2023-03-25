import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/utilities/app_colors.dart';
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

  final double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          actionsIconTheme: const IconThemeData(color: ApplicationColors.actionsIconThemeColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ApplicationColors.appBarbackGroundColor,
            //statusBarIconBrightness: Brightness.light,
          ),
          centerTitle: false,
          backgroundColor: ApplicationColors.appBarbackGroundColor,
          elevation: _elevation,
          titleTextStyle: const TextStyle(
            color: ApplicationColors.titleColor,
            fontFamily: ApplicationConstants.titleFontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          iconTheme: const IconThemeData(
            color: ApplicationColors.actionsIconThemeColor,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            color: ApplicationColors.titleColor,
          ),
          labelLarge: const TextStyle(
            color: Colors.black,
          ),

          // bodyText2: TextStyle(backgroundColor: Colors.grey), HATA veriyor araştır.
        ),
        scaffoldBackgroundColor: ApplicationColors.scaffoldBackGroundColor,
        // textButtonTheme:
        //     TextButtonThemeData(style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero))),
        iconTheme: const IconThemeData(
          color: ApplicationColors.titleColor,
        ),
      ),
      title: ApplicationConstants.pendingTitle,
      home: const LandingPage(),
    );
  }
}
