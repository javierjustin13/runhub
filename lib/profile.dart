import 'package:flutter/material.dart';
import 'package:runhub/utilities/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<String?> _getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        children: [
          FutureBuilder<String?>(
            future: _getEmail(),
            builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error occurred');
              } else if (snapshot.hasData && snapshot.data == "") {
                return const Text('You Logged In with Authorized Account');
              } else if (snapshot.hasData && snapshot.data != null) {
                return Text(
                  'Hi, ${snapshot.data}',
                  style: CustomWidgets.heading1,
                );
              } else {
                return const Text('You Logged In with Authorized Account');
              }
            },
          ),
        ],
      ),
    );
  }
}
