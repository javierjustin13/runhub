import 'package:flutter/material.dart';
import 'package:runhub/splash.dart';
import 'package:runhub/utilities/custom_theme.dart';
import 'package:runhub/utilities/variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionsBuilder(),
          TargetPlatform.iOS: CustomPageTransitionsBuilder(),
        },
      ),
      primaryColor: CustomWidgets.defaultOrange,
    ),
    home: const SplashScreen(),
  ));
}
