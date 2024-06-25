import 'package:flutter/material.dart';
import 'dart:async';

class TimingWindow extends StatefulWidget {
  const TimingWindow({super.key});

  @override
  State<TimingWindow> createState() => _TimingWindowState();
}

class _TimingWindowState extends State<TimingWindow> {
  Timer _timer =
      new Timer(Duration(minutes: 25), () => print(":Timer started"));
  int _start = 25 * 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$_timer",
            style: TextStyle(
              color: Color(
                0xffffffff,
              ),
            ),
          )
        ],
      ),
    );
  }
}
