import 'package:flutter/material.dart';
import 'package:runhub/profileEdit.dart';
import 'package:runhub/profileActivites.dart';
import 'package:runhub/record.dart';
import 'package:runhub/route.dart';
import 'package:runhub/utilities/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:runhub/profile.dart';
import 'package:runhub/login.dart';

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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(Variables.appBarBottomBorder),
            child: Container(
              color: CustomWidgets.defaultOrange,
              height: Variables.appBarBottomBorder,
            ),
          ),
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
          currentIndex: (widget.selectedIndex > 3) ? 3:widget.selectedIndex,
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Text("INI HOMESC YA"),
    );
  }
}
