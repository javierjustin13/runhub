import 'dart:async';
import 'package:flutter/material.dart';

class DetailRecordPage extends StatefulWidget {
  const DetailRecordPage({super.key});

  @override
  State<DetailRecordPage> createState() => _DetailRecordPageState();
}

class _DetailRecordPageState extends State<DetailRecordPage> {
  late Stopwatch _stopwatch;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _duration = const Duration();
    _startTimer();
  }

  void _startTimer() {
    _stopwatch.start();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _duration = _stopwatch.elapsed;
      });
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _duration.inHours.toString().padLeft(2, '0');
    final minutes = (_duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          Column(
            children: [
              const Text(
                'TIME',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$hours:$minutes:$seconds',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Column(
            children: [
              Text(
                'SPLIT AVERAGE PACE',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                '- : -',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '/KM',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '${hours != '00' ? '$hours:' : ''}$minutes:$seconds',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    'TIME',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              const Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'KM',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_stopwatch.isRunning) {
                      _stopwatch.stop();
                    } else {
                      _stopwatch.start();
                    }
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.all(24),
                  ),
                  child: Icon(
                    _stopwatch.isRunning ? Icons.stop : Icons.play_arrow,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
