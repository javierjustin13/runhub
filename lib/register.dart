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
  EmailPasswordController emailPasswordController = EmailPasswordController();
  bool _obscureCharacter = true;

  bool accepted = false;
  String errorMessage = "";

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('email', emailPasswordController.emailController.text);
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
                vertical: screenHeight * Variables.paddingDefault,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create an Account",
                    textAlign: TextAlign.left,
                    style: CustomWidgets.heading1,
                  ),
                  const Text(
                    "Hi, create your account",
                    textAlign: TextAlign.left,
                    style: CustomWidgets.heading2,
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
                      labelStyle: CustomWidgets.labelStyle,
                    ),
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
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: accepted,
                        activeColor: CustomWidgets.defaultOrange,
                        onChanged: (bool? value) {
                          setState(() {
                            accepted = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        "I agree to the",
                        style: CustomWidgets.simpleText,
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Terms & Conditions'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "The RunHub websites, related mobile applications and services (collectively, the “Services”) are made available to you by Strava, Inc. with its address at 208 Utah Street, San Francisco, CA 94103, USA, subject to these Terms of Service (the “Terms”) and in accordance with the Strava Privacy Policy (the “Privacy Policy”). More information about the Services may be found at https://RunHub.com."
                                        "\nYou agree to comply with these Terms and any supplemental terms which Strava makes available to you on the Services which shall form part of the Terms. Strava reserves the right to review accounts and user actions on the Services to ensure compliance with our Terms. \n\nBY ACCESSING, USING OR UPLOADING OR DOWNLOADING ANY INFORMATION OR MATERIALS TO OR FROM THE SERVICES, OR BY INDICATING YOUR ASSENT TO THESE TERMS BY CREATING AN ACCOUNT, CLICKING “SIGN UP” OR ANY SIMILAR MECHANISM, YOU ARE AGREEING TO THESE TERMS. IF YOU DO NOT AGREE TO THESE TERMS, DO NOT ACCESS OR USE THE SERVICES. This agreement was written in English. To the extent a translated version of the Terms conflict with the English version, the English version controls.",
                                        style: CustomWidgets.simpleText,
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      const Text(
                                        "\nYou agree to comply with these Terms and any supplemental terms which Strava makes available to you on the Services which shall form part of the Terms. Strava reserves the right to review accounts and user actions on the Services to ensure compliance with our Terms. \nIf you access or use the Services on behalf of a company or other entity, you represent that you have authority to bind such entity and its affiliates to these Terms and that it is fully binding on them. In such case, the term “you” will refer to such entity and its affiliates. If you do not have authority, you may not access or use the Services. These Terms contain disclaimers of warranties and limitations on liability that may be applicable to you.\nThe Strava Services cannot be provided and the agreement described in these Terms of Service cannot be performed without Strava processing data about you, and other Strava users, including your location data. Processing of the data you share with Strava, including location data, is essential to the Services we provide and a necessary part of our performance of the agreement we have with you.",
                                        style: CustomWidgets.simpleText,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Terms & Conditions",
                          style: TextStyle(
                            color: CustomWidgets.defaultOrange,
                            fontFamily: 'SF',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      errorMessage,
                      style: CustomWidgets.errorText,
                    ),
                  ),
                  if (errorMessage != "")
                    SizedBox(
                      height: screenHeight * 0.02,
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
                            } else if (!accepted) {
                              errorMessage =
                                  "Please accept the terms & conditions";
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
                            Variables.buttonEdgeRadius,
                          ),
                        ),
                        backgroundColor: CustomWidgets.defaultOrange,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Sign Up",
                        style: CustomWidgets.normalText,
                      ),
                    ),
                  ),
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
                        style: CustomWidgets.smallText,
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
                            Variables.buttonEdgeRadius,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 3,
                        foregroundColor: Colors.black,
                      ),
                      icon: const Icon(Icons.apple),
                      iconAlignment: IconAlignment.start,
                      label: const Text(
                        "Sign Up with Apple",
                        style: CustomWidgets.normalText,
                      ),
                    ),
                  ),
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
                            Variables.buttonEdgeRadius,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 3,
                        foregroundColor: Colors.black,
                      ),
                      icon: const Icon(Icons.facebook),
                      label: const Text(
                        "Sign Up with Facebook",
                        style: CustomWidgets.normalText,
                      ),
                    ),
                  ),
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
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFFF7931E),
                            fontFamily: 'SF',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
