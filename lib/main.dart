import 'package:flutter/material.dart';
import 'package:runhub/utilities/custom_theme.dart';
import 'package:runhub/login_register.dart';
import 'package:runhub/utilities/variables.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionsBuilder(),
          TargetPlatform.iOS: CustomPageTransitionsBuilder(),
        },
      ),
      dialogTheme:
          const DialogTheme(backgroundColor: Color(Variables.customColor)),
      primaryColor: const Color(Variables.customColor),
    ),
    home: const LoginRegister(),
  ));
}
