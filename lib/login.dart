import 'package:flutter/material.dart';
import 'package:runhub/home.dart';
import 'package:runhub/register.dart';
import 'package:runhub/utilities/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMessage = "";

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('email', emailController.text);

    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Home()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * Variables.widthPaddingDefault,
                  vertical: screenHeight * Variables.paddingDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login Account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: Variables.heading1,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF'),
                  ),
                  const Text(
                    "Hi, welcome back to your account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: Variables.normalText, fontFamily: 'SF'),
                  ),
                  Center(
                    child: Image(
                      image: const AssetImage('assets/login.png'),
                      height: screenHeight * 0.3,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      icon: Icon(Icons.email),
                      labelText: 'Email',
                      iconColor: Colors.grey,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: Variables.normalText,
                          fontFamily: 'SF'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      iconColor: Colors.grey,
                      border: UnderlineInputBorder(),
                      icon: Icon(Icons.password),
                      suffix: Icon(Icons.visibility),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: Variables.normalText,
                          fontFamily: 'SF'),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red, fontFamily: 'SF'),
                  )),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: screenWidth * Variables.buttonWidthToScreen,
                      height: screenHeight * Variables.buttonHeightToScreen,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            setState(() {
                              errorMessage = "";
                              _login();
                            });
                          } else {
                            setState(() {
                              errorMessage = "Please fill in all fields";
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Variables.buttonEdgeRadius),
                          ),
                          backgroundColor: const Color(0xFFF7931E),
                          elevation: 0,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: Variables.normalText, fontFamily: 'SF'),
                        ),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: screenWidth * 0.3,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const Text(
                        "OR",
                        style: TextStyle(
                            fontSize: Variables.smallText, fontFamily: 'SF'),
                      ),
                      Container(
                        width: screenWidth * 0.3,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  SizedBox(
                      width: screenWidth * Variables.buttonWidthToScreen,
                      height: screenHeight * Variables.buttonHeightToScreen,
                      child: ElevatedButton.icon(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Variables.buttonEdgeRadius),
                          ),
                          backgroundColor: Colors.white,
                          elevation: 3,
                          foregroundColor: Colors.black,
                        ),
                        icon: const Icon(Icons.apple),
                        iconAlignment: IconAlignment.start,
                        label: const Text(
                          "Login with Apple",
                          style: TextStyle(
                              fontSize: Variables.normalText, fontFamily: 'SF'),
                        ),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(
                      width: screenWidth * Variables.buttonWidthToScreen,
                      height: screenHeight * Variables.buttonHeightToScreen,
                      child: ElevatedButton.icon(
                          iconAlignment: IconAlignment.start,
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  Variables.buttonEdgeRadius),
                            ),
                            backgroundColor: Colors.white,
                            elevation: 3,
                            foregroundColor: Colors.black,
                          ),
                          icon: const Icon(Icons.facebook),
                          label: const Text(
                            "Login with Facebook",
                            style: TextStyle(
                                fontSize: Variables.normalText,
                                fontFamily: 'SF'),
                          ))),
                  // create not have an account yet button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not Registered Yet?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                          child: const Text(
                            "Create an Account",
                            style: TextStyle(
                                color: Color(Variables.customColor),
                                fontFamily: 'SF'),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
