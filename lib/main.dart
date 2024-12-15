import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_joke_screen.dart';
import 'screens/jokes_by_type_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/random_joke': (context) => RandomJokeScreen(),
        '/jokes_by_type': (context) => JokesByTypeScreen(),
      },
    );
  }
}
