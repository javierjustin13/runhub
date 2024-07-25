import 'dart:async';
import 'package:flutter/material.dart';
import 'package:runhub/save_activity.dart'; // Ensure you have the correct import path

class DetailRecordPage extends StatefulWidget {
  const DetailRecordPage({super.key});

  @override
  State<DetailRecordPage> createState() => _DetailRecordPageState();
}

class _DetailRecordPageState extends State<DetailRecordPage>
    with SingleTickerProviderStateMixin {
  late Stopwatch _stopwatch;
  late Duration _duration;
  bool _isMapView = false;
  bool _isStopped = false;

  final List<String> _motivationalMessages = [
    "Keep going, you're doing great!",
    "Every step counts!",
    "Push your limits!",
    "Stay strong and keep moving!",
    "Believe in yourself!",
    "You can do it!",
    "Never give up!",
    "Your only limit is you!",
    "Dream it. Wish it. Do it.",
    "Success is no accident!",
  ];

  String _currentMotivationalMessage = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _duration = const Duration();
    _startTimer();
    _startMotivationalMessageTimer();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  void _startTimer() {
    _stopwatch.start();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _duration = _stopwatch.elapsed;
      });
    });
  }

  void _startMotivationalMessageTimer() {
    _currentMotivationalMessage = _motivationalMessages[0];
    Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      setState(() {
        _currentMotivationalMessage =
            _motivationalMessages[timer.tick % _motivationalMessages.length];
        _animationController.reset();
        _animationController.forward();
      });
    });
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _animationController.dispose();
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
          _isMapView
              ? _buildMapView()
              : _buildTimerView(hours, minutes, seconds),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      _currentMotivationalMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isStopped
                        ? Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _stopwatch.start();
                                  setState(() {
                                    _isStopped = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.green,
                                  padding: const EdgeInsets.all(24),
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 30),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SaveActivity(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: const EdgeInsets.all(24),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  'Finish',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _stopwatch.stop();
                              setState(() {
                                _isStopped = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.orange,
                              padding: const EdgeInsets.all(24),
                            ),
                            child: const Icon(
                              Icons.stop,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                    const SizedBox(width: 30),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: _isMapView ? Colors.blue : Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.orange,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMapView = !_isMapView;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerView(String hours, String minutes, String seconds) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          const SizedBox(height: 40),
          const Text(
            'SPLIT AVERAGE PACE',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const Text(
            '- : -',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            '/KM',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),
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
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/record_background.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
