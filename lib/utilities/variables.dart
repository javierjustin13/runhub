import 'package:flutter/material.dart';

class Variables {
  static double paddingDefault = 0.05;
  static double widthPaddingDefault = 0.075;

  static double buttonWidthToScreen = 0.85;
  static double buttonHeightToScreen = 0.06;

  static double buttonEdgeRadius = 12;

  // Sesuai Ketentuan iPhone
  static const double smallText = 13;
  static const double normalText = 17;
  static const double heading1 = 28;
  static const double heading2 = 22;

  static const int customColor = 0xFFF7931E;

  static const double appBarBottomBorder = 2.0;
}

class CustomWidgets {
  static const Color defaultOrange = Color(Variables.customColor);
  static const TextStyle heading1 = TextStyle(
    fontSize: Variables.heading1,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF',
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: Variables.heading2,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF',
  );
  static const TextStyle normalText = TextStyle(
    fontSize: Variables.normalText,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF',
  );
  static const TextStyle smallText = TextStyle(
    fontSize: Variables.smallText,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF',
  );
  static const TextStyle simpleText = TextStyle(
    fontFamily: 'SF',
  );
  static const TextStyle errorText = TextStyle(
    color: Colors.red,
    fontFamily: 'SF',
  );
  static const TextStyle labelStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: 'SF',
    fontSize: Variables.normalText,
  );
}

class EmailPasswordController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}