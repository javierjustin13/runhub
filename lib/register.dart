import 'package:flutter/material.dart';
import 'package:runhub/home.dart';
import 'package:runhub/login.dart';
import 'package:runhub/utilities/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool accepted = false;
  String errorMessage = "";

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('email', emailController.text);
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
                    "Create an Account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: Variables.heading1,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SF'),
                  ),
                  const Text(
                    "Hi, create your account",
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
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                          fontFamily: 'SF',
                          fontSize: Variables.normalText),
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
                          fontWeight: FontWeight.w800,
                          fontFamily: 'SF',
                          color: Colors.grey,
                          fontSize: Variables.normalText),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: accepted,
                          activeColor: const Color(Variables.customColor),
                          onChanged: (bool? value) {
                            setState(() {
                              accepted = value ?? false;
                            });
                          }),
                      const Text(
                        "I agree to the",
                        style: TextStyle(
                            fontFamily: 'SF', fontSize: Variables.normalText),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Terms and Conditions",
                            style: TextStyle(
                                fontSize: Variables.normalText,
                                color: Color(Variables.customColor),
                                fontFamily: 'SF'),
                          ))
                    ],
                  ),
                  Center(
                    child: Text(errorMessage,
                        style: const TextStyle(
                            color: Colors.red, fontFamily: 'SF')),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SizedBox(
                      width: screenWidth * Variables.buttonWidthToScreen,
                      height: screenHeight * Variables.buttonHeightToScreen,
                      child: ElevatedButton(
                        onPressed: () {
                          if (accepted &&
                              emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            _login();
                          } else {
                            setState(() {
                              errorMessage = "Please fill all the fields";
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
                          "Sign Up",
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
                          "Sign Up with Apple",
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
                            "Sign Up with Facebook",
                            style: TextStyle(
                                fontSize: Variables.normalText,
                                fontFamily: 'SF'),
                          ))),
                  // create not have an account yet button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Have an Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Color(0xFFF7931E), fontFamily: 'SF'),
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
