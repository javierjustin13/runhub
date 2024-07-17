import 'package:flutter/material.dart';
import 'package:runhub/utilities/variables.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
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
              // padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.directions_walk),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.directions_bike),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Variables.pool),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.directions_run),
                    onPressed: () {},
                    color: Colors.white,
                  ),
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
}
