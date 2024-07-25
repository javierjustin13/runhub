import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:runhub/home.dart';
import 'package:runhub/utilities/variables.dart';

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
    final confetti = ConfettiController(duration: const Duration(seconds: 1));
    CardSwiperController controller = CardSwiperController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConfettiWidget(
              confettiController: confetti,
              gravity: 0.2,
            ),
            Container(
              color: Colors.white,
              width: screenWidth * 0.9,
              height: screenHeight * 0.035,
              child: const Center(
                child: Text("Choose Your Favorite Route!",
                    style: CustomWidgets.normalText),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Column(
              children: [
                Container(
                    color: Colors.white,
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.68,
                    child: CardSwiper(
                      cardBuilder: (context, index, x, y) {
                        return ClipRect(
                          child: Image.asset(images[index], fit: BoxFit.cover),
                        );
                      },
                      cardsCount: 7,
                      numberOfCardsDisplayed: 2,
                      isLoop: true,
                      onSwipe: (previous, current, direction) {
                        if (direction == CardSwiperDirection.right) {
                          confetti.play();
                        }
                        return true;
                      },
                      controller: controller,
                    )),
                Container(
                  color: Colors.white,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.white,
                          iconColor: Colors.red,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          setState(() {
                            controller.swipe(CardSwiperDirection.left);
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 30, // Icon size
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          iconColor: Colors.blue,
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          setState(() {
                            confetti.play();
                            controller.swipe(CardSwiperDirection.right);
                            // go to record page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(selectedIndex: 2)),
                            );
                          });
                        },
                        child: const Icon(
                          Icons.check,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
