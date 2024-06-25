import 'package:flutter/material.dart';
import 'screens/timer.dart';
import 'screens/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.new(
        scaffoldBackgroundColor: Color.fromARGB(255, 45, 45, 45),
      ),
      home: MainScreen(),
      routes: {
        '/timer': (context) => TimingWindow(),
      },
    );
  }
}
