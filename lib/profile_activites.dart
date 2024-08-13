import 'package:flutter/material.dart';

class ProfActivities extends StatefulWidget {
  const ProfActivities({super.key});

  @override
  State<ProfActivities> createState() => _ProfActPageState();
}

class _ProfActPageState extends State<ProfActivities> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            width: screenWidth * 0.95,
            height: screenHeight * 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFFFBFBFB),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                                AssetImage('assets/profile_picture.png'),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abdhy Samoedra',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'May 25, 2024 at 8:30 PM',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                            child: const Text(
                              'Morning Run',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Distance'),
                              Text(
                                '0.00 km',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Pace'),
                              Text(
                                '11:00/km',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Time'),
                              Text(
                                '1h 12m 1s',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: const Color(0xFFFBFBFB),
                            child: const Image(
                              image: AssetImage('assets/photo_post.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFFFBFBFB),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                                AssetImage('assets/profile_picture.png'),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abdhy Samoedra',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'May 25, 2024 at 8:30 PM',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 8, 0, 8),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Afternoon Run',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'Pergi ke Venesia makan ketoprak',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: const Color(0xFFFBFBFB),
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                                AssetImage('assets/profile_picture.png'),
                          ),
                          SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Abdhy Samoedra',
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'May 25, 2024 at 8:30 PM',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 8, 0, 8),
                            child: const Text(
                              'Morning Run',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text('Distance'),
                              Text(
                                '0.00 km',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Pace'),
                              Text(
                                '11:00/km',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text('Time'),
                              Text(
                                '1h 12m 1s',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: const Color(0xFFFBFBFB),
                            child: const Image(
                              image: AssetImage('assets/photo_post.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
