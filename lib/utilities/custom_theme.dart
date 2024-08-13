import 'package:flutter/material.dart';
class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin:
            const Offset(1.0, 0.0), // Start from the right side of the screen
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
