import 'package:flutter/material.dart';
import 'package:runhub/login.dart';
import 'package:runhub/register.dart';
import 'package:runhub/utilities/variables.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    double upperArea = 72;
    double lowerArea = 28;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: upperArea.toInt(),
                    child: Container(
                        color: Colors.white,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/login_image.jpg'),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 50,
                                right: 50,
                                top: 25,
                                child: Image.asset(
                                  'assets/logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ))),
                Expanded(
                    flex: lowerArea.toInt(),
                    child: Container(
                      color: const Color(Variables.customColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                screenWidth * Variables.widthPaddingDefault,
                            vertical: screenHeight * Variables.paddingDefault),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                      width: screenWidth *
                                          Variables.buttonWidthToScreen,
                                      height: screenHeight *
                                          Variables.buttonHeightToScreen,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Login()));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Variables.buttonEdgeRadius),
                                          ),
                                          backgroundColor: Colors.white,
                                          elevation: 0,
                                          foregroundColor: Colors.black,
                                        ),
                                        child: const Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: Variables.normalText,
                                              fontFamily: 'SF'),
                                        ),
                                      )),
                                  SizedBox(
                                    width: screenWidth *
                                        Variables.buttonWidthToScreen,
                                    height: screenHeight *
                                        Variables.buttonHeightToScreen,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Register()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Variables.buttonEdgeRadius),
                                          ),
                                          backgroundColor: Colors.black,
                                          elevation: 0,
                                          foregroundColor: Colors.white),
                                      child: const Text(
                                        "Create an Account",
                                        style: TextStyle(
                                            fontSize: Variables.normalText,
                                            fontFamily: 'SF'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
