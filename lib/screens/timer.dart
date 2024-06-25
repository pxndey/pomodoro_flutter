import 'package:flutter/material.dart';
import 'dart:async';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class TimingWindow extends StatefulWidget {
  const TimingWindow({super.key});

  @override
  State<TimingWindow> createState() => _TimingWindowState();
}

class _TimingWindowState extends State<TimingWindow> {
  Timer? _timer;
  int _start = 25 * 60; // 25 minutes in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
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
    _timer?.cancel();
    super.dispose();
    Navigator.pop(context);
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: GradientText(
              gradient: LinearGradient(
                colors: [Color(0xFF68D1F0), Color(0xFF5C7CAE)],
              ),
              timerText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => {dispose()},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GradientText(
                "EXIT",
                gradient: LinearGradient(
                  colors: [Color(0xFF68D1F0), Color(0xFF5C7CAE)],
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
