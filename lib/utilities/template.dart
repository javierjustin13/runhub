import 'package:flutter/material.dart';
import 'package:runhub/utilities/variables.dart';

class NamaWidget extends StatefulWidget {
  const NamaWidget({super.key});

  @override
  State<NamaWidget> createState() => _NamaWidgetState();
}

class _NamaWidgetState extends State<NamaWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * Variables.widthPaddingDefault,
              vertical: screenHeight * Variables.paddingDefault),
          child: const Center(/* blablablalba*/),
        ),
      ),
    );
  }
}
