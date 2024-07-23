import 'package:flutter/material.dart';
import 'package:runhub/home.dart';
import 'package:runhub/login.dart';
import 'package:runhub/utilities/variables.dart';

class SaveActivity extends StatefulWidget {
  const SaveActivity({super.key});

  @override
  State<SaveActivity> createState() => _SaveActivityState();
}

class _SaveActivityState extends State<SaveActivity> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Save Activity',
          style:
              TextStyle(color: CustomWidgets.defaultOrange, fontFamily: 'SF'),
        ),
        bottom: CustomWidgets.defaultAppBarBottomBorder,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: const Text(
              'SAVE',
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: 17,
                color: CustomWidgets.defaultOrange,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * Variables.widthPaddingDefault,
            vertical: screenHeight * Variables.paddingDefault,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  iconColor: Colors.grey,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomWidgets.defaultOrange),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Title Your Run',
                  focusColor: CustomWidgets.defaultOrange,
                  fillColor: CustomWidgets.defaultOrange,
                  labelStyle: CustomWidgets.labelStyle,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              TextFormField(
                decoration: const InputDecoration(
                  iconColor: Colors.grey,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomWidgets.defaultOrange),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'How\'d it go? Share more about your activity',
                  focusColor: CustomWidgets.defaultOrange,
                  fillColor: CustomWidgets.defaultOrange,
                  labelStyle: CustomWidgets.labelStyle,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomWidgets.defaultOrange),
                  ),
                  border: UnderlineInputBorder(),
                ),
                hint: const Text(
                  'Select Activity Type',
                  style: CustomWidgets.labelStyle,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Run',
                    child: Row(
                      children: [
                        Icon(Icons.run_circle_outlined),
                        SizedBox(width: 10),
                        Text("Run")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Swim',
                    child: Row(
                      children: [
                        Icon(Icons.pool),
                        SizedBox(width: 10),
                        Text("Swim")
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: screenHeight * 0.025),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomWidgets.defaultOrange,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                width: screenWidth * 0.39,
                                height: screenHeight * 0.195,
                                image: AssetImage('assets/en_route/1.png'),
                                alignment: Alignment.center,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomWidgets.defaultOrange,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_outlined,
                                  color: CustomWidgets.defaultOrange),
                              TextButton(
                                child: Text(
                                  'Add Photos',
                                  style: CustomWidgets.labelStyle,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // create button here
                  SizedBox(
                    width: screenWidth * 0.825,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Change Map Type',
                        style: TextStyle(
                          fontFamily: 'SF',
                          color: CustomWidgets.defaultOrange,
                          fontSize: 17,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: CustomWidgets.defaultOrange, // Border color
                          width: 2, // Border width
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 0,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              Text(
                textAlign: TextAlign.left,
                "Details",
                style: CustomWidgets.heading1,
              ),
              Text("lanjut kerja sini jou blablablabla"),
            ],
          ),
        ),
      ),
    );
  }
}
