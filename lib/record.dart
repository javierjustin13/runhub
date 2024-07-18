import 'package:flutter/material.dart';
import 'package:runhub/utilities/variables.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  // Define a state variable to keep track of the active icon
  int _activeIconIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/record_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // First bar with icons
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(0, Icons.directions_walk),
                  _buildIconButton(1, Icons.directions_bike),
                  _buildIconButton(2, Variables.pool),
                  _buildIconButton(3, Icons.directions_run),
                ],
              ),
            ),
            // Second bar with start button
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeIconIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4.0), // Smaller padding for smaller box
        decoration: BoxDecoration(
          color: _activeIconIndex == index ? Colors.white : Colors.orange,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          color: _activeIconIndex == index ? Colors.orange : Colors.white,
        ),
      ),
    );
  }
}
