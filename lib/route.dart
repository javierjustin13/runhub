import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  List images = [
    'assets/en_route/1.png',
    'assets/en_route/2.png',
    'assets/en_route/3.png',
    'assets/en_route/4.png',
    'assets/en_route/5.png',
    'assets/en_route/6.png',
    'assets/en_route/7.png'
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
          color: Colors.white,
          width: screenWidth * 0.9,
          height: screenHeight * 0.7,
          child: CardSwiper(
            cardBuilder: (context, index, x, y) {
              return ClipRect(
                child: Image.asset(images[index], fit: BoxFit.cover),
              );
            },
            cardsCount: 7,
            numberOfCardsDisplayed: 3,
          )),
    );
  }
}
