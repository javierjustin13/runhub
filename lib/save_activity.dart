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
                                image:
                                    const AssetImage('assets/en_route/1.png'),
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
                              const Icon(Icons.camera_alt_outlined,
                                  color: CustomWidgets.defaultOrange),
                              TextButton(
                                child: const Text(
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
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
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
                      child: const Text(
                        'Change Map Type',
                        style: TextStyle(
                          fontFamily: 'SF',
                          color: CustomWidgets.defaultOrange,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              const Text(
                textAlign: TextAlign.left,
                "Details",
                style: CustomWidgets.heading1,
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
                  'Type of run',
                  style: CustomWidgets.labelStyle,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Long Run',
                    child: Row(
                      children: [
                        Icon(Icons.directions_run),
                        SizedBox(width: 10),
                        Text("Long Run")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Workout',
                    child: Row(
                      children: [
                        Icon(Icons.sports_gymnastics),
                        SizedBox(width: 10),
                        Text("Workout")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Race',
                    child: Row(
                      children: [
                        Icon(Icons.flag),
                        SizedBox(width: 10),
                        Text("Race")
                      ],
                    ),
                  ),
                  
                ],
                onChanged: (value) {},
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
                  'How did that activity feel?',
                  style: CustomWidgets.labelStyle,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Easy',
                    child: Row(
                      children: [
                        Icon(Icons.filter_1),
                        SizedBox(width: 10),
                        Text("Easy")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Moderate',
                    child: Row(
                      children: [
                        Icon(Icons.filter_2),
                        SizedBox(width: 10),
                        Text("Moderate")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Max Effort',
                    child: Row(
                      children: [
                        Icon(Icons.filter_3),
                        SizedBox(width: 10),
                        Text("Max Effort")
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: screenHeight * 0.025),
              TextFormField(
                decoration: const InputDecoration(
                  iconColor: Colors.grey,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomWidgets.defaultOrange),
                  ),
                  border: UnderlineInputBorder(),
                  labelText: 'Jot down private notes here. Only you can see these.',
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
                  'Who can see?',
                  style: CustomWidgets.labelStyle,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Everyone',
                    child: Row(
                      children: [
                        Icon(Icons.groups),
                        SizedBox(width: 10),
                        Text("Everyone")
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Only You',
                    child: Row(
                      children: [
                        Icon(Icons.man),
                        SizedBox(width: 10),
                        Text("Only You")
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: screenHeight * 0.025),
              SizedBox(
                    width: screenWidth * 0.825,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
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
                      child: const Text(
                        'Discard Activity',
                        style: TextStyle(
                          fontFamily: 'SF',
                          color: CustomWidgets.defaultOrange,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
