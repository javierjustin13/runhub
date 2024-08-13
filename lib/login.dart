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
  EmailPasswordController emailPasswordController = EmailPasswordController();

  String errorMessage = "";

  bool _obscureCharacter = true;

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString(
        'email', emailPasswordController.emailController.text);

    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                    style: CustomWidgets.heading1,
                  ),
                  const Text(
                    "Hi, welcome back to your account",
                    textAlign: TextAlign.left,
                    style: CustomWidgets.normalText,
                  ),
                  Center(
                    child: Image(
                      image: const AssetImage('assets/login.png'),
                      height: screenHeight * 0.3,
                    ),
                  ),
                  TextFormField(
                    controller: emailPasswordController.emailController,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CustomWidgets.defaultOrange)),
                        border: UnderlineInputBorder(),
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                        iconColor: Colors.grey,
                        labelStyle: CustomWidgets.labelStyle),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextFormField(
                    controller: emailPasswordController.passwordController,
                    obscureText: _obscureCharacter, // Corrected this line
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: CustomWidgets.defaultOrange)),
                      iconColor: Colors.grey,
                      border: const UnderlineInputBorder(),
                      icon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureCharacter
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureCharacter = !_obscureCharacter;
                          });
                        },
                      ),
                      labelText: 'Password',
                      labelStyle: CustomWidgets.labelStyle,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Center(
                      child: Text(
                    errorMessage,
                    style: CustomWidgets.errorText,
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: screenWidth * Variables.buttonWidthToScreen,
                      height: screenHeight * Variables.buttonHeightToScreen,
                      child: ElevatedButton(
                        onPressed: () {
                          if (emailPasswordController
                                  .emailController.text.isNotEmpty &&
                              emailPasswordController
                                  .passwordController.text.isNotEmpty) {
                            setState(() {
                              if (emailPasswordController
                                      .emailController.text.isEmpty ||
                                  emailPasswordController
                                      .passwordController.text.isEmpty) {
                                errorMessage = "Please fill all the fields";
                              } else if (!emailPasswordController
                                  .emailController.text
                                  .contains('@')) {
                                errorMessage = "Email is not valid";
                              } else if (emailPasswordController
                                      .passwordController.text.length <
                                  6) {
                                errorMessage =
                                    "Password must be at least 6 characters";
                              } else {
                                errorMessage = "";
                                _login();
                              }
                            });
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
                          backgroundColor: CustomWidgets.defaultOrange,
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
                      const Text("OR", style: CustomWidgets.smallText),
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
                        label: const Text(
                          "Login with Apple",
                          style: CustomWidgets.normalText,
                        ),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
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
                          icon: const Icon(Icons.facebook),
                          label: const Text(
                            "Login with Facebook",
                            style: CustomWidgets.normalText,
                          ))),
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
                                color: CustomWidgets.defaultOrange,
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
