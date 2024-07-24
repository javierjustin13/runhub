import 'package:flutter/material.dart';
import 'package:runhub/profile_edit.dart';
import 'package:runhub/profile_activites.dart';
import 'package:runhub/record.dart';
import 'package:runhub/route.dart';
import 'package:runhub/utilities/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:runhub/profile.dart';
import 'package:runhub/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  int selectedIndex = 0;
  Home({super.key, this.selectedIndex = 0});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // get string email from sharedpreferences
  Future<String?> _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (context.mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  static const TextStyle appBarStyle = TextStyle(
      fontSize: Variables.heading2,
      fontWeight: FontWeight.bold,
      color: Color(Variables.customColor));

  static const List<Widget> _widgetOptions = <Widget>[
    Text('HOME', style: appBarStyle),
    Text('ROUTE', style: appBarStyle),
    Text('RECORD', style: appBarStyle),
    Text('PROFILE', style: appBarStyle),
    Text('EDIT PROFILE', style: appBarStyle),
    Text('ACTIVITIES', style: appBarStyle),
  ];

  static const List<Widget> _navigator = <Widget>[
    HomePage(),
    RoutePage(),
    RecordPage(),
    ProfilesPage(),
    ProfileEditPage(),
    ProfActivities()
  ];

  void _onItemTapped(int index) {
    setState(() {
      // set selected index from Home to index
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF1F1F1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: _widgetOptions.elementAt(widget.selectedIndex),
          bottom: CustomWidgets.defaultAppBarBottomBorder,
          actions: [
            IconButton(
              iconSize: 30,
              color: CustomWidgets.defaultOrange,
              icon: const Icon(Icons.logout),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: _navigator.elementAt(widget.selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'ROUTE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.record_voice_over),
              label: 'RECORD',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'PROFILE',
            ),
          ],
          currentIndex: (widget.selectedIndex > 3) ? 3 : widget.selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget padded(Widget child) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5), child: child);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          padded(Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFFBFBFB),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 27,
                      child: Text(
                        'Your Weekly Snapshot',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                      child: Center(
                        child: Text(
                          'See More',
                          style: TextStyle(
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Activities'),
                        const Text(
                          '0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xFFF7931E),
                          ),
                          child: const Text(
                            'Hello container 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hello container 1'),
                        const Text(
                          '0h 0m',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xFFF7931E),
                          ),
                          child: const Text(
                            'Hello container 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Hello container 1'),
                        const Text(
                          '0.00 km',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xFFF7931E),
                          ),
                          child: const Text(
                            'Hello container 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
          padded(Container(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFFBFBFB),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Suggested Challenge',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  'Make accountability a little easier, more fun and earn rewards!',
                  style: TextStyle(fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 190, // Specify a fixed width for containers
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(color: Colors.amber, width: 2.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/image4.png'),
                              height: 100, // Specify height
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              '5K Run & Walk',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const Text(
                              'Chase your best 5K run with RunHub.',
                              style: TextStyle(fontSize: 10),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF7931E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: const Size(80, 25),
                              ),
                              child: const Text(
                                'Join Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 190, // Specify a fixed width for containers
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                Border.all(color: Colors.amber, width: 2.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('assets/image4.png'),
                              height: 100, // Specify height
                              fit: BoxFit.contain,
                            ),
                            const Text(
                              '5K Run & Walk',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const Text(
                              'Chase your best 5K run with RunHub.',
                              style: TextStyle(fontSize: 10),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Handle button press
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF7931E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: const Size(80, 25),
                              ),
                              child: const Text(
                                'Join Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          padded(Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFFBFBFB),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    padded(Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: const Image(
                          height: 50,
                          width: 50,
                          image: AssetImage('assets/image1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jason Gay',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text('This is your profile'),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      child: const Text(
                        'Afternoon Run',
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
                padded(const Row(
                  children: [
                    Expanded(
                        child: Image(
                      image: AssetImage('assets/image2.jpg'),
                      fit: BoxFit.cover,
                    ))
                  ],
                ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}
