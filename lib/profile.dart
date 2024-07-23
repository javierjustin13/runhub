import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:runhub/home.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  String name = '';
  String location = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      location = prefs.getString('location') ?? '';
      email = prefs.getString('email') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.045, vertical: screenHeight * 0.045),
        width: screenWidth * 0.9,
        height: screenHeight * 2,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(selectedIndex: 4)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xFFFBFBFB),
                ),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/profile_picture.png'),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.isNotEmpty ? name : 'Abdhy Samoedra',
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(location.isNotEmpty ? location : 'Sentul, Bogor'),
                        const Text('Joined May 2024'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home(selectedIndex: 5,)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xFFFBFBFB),
                ),
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Activities', style: TextStyle(fontSize: 18.0)),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFFBFBFB),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: const Text(
                          'This Week',
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
                        color: const Color(0xFFFBFBFB),
                        child: const Image(
                          image: AssetImage('assets/graph_image.png'),
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
    );
  }
}
