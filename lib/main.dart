import 'package:flutter/material.dart';

void main() {
  runApp(const RunHub());
}

class RunHub extends StatelessWidget {
  const RunHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RunHub',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: 77,
                    child: Container(
                        color: Colors.white,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/login_image.png'),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 50,
                                right: 50,
                                top: 25,
                                child: Image.asset(
                                  'assets/logo.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ))),
                Expanded(
                    flex: 23,
                    child: Container(
                      color: const Color(0xFFF7931E),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        foregroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        backgroundColor: Colors.black,
                                        elevation: 0,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      "Create an Account",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ))
              ],
            ),
          ),
        ));
  }
}
