import 'package:flutter/material.dart';
import 'package:quizapp/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
      // home: const EndPage(point: 5),
    );
  }
}
