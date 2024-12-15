import 'package:flutter/material.dart';
import '../services/api_services.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  String? joke;

  @override
  void initState() {
    super.initState();
    _loadRandomJoke();
  }

  Future<void> _loadRandomJoke() async {
    final fetchedJoke = await ApiService.getRandomJoke();
    setState(() {
      joke = fetchedJoke;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Joke"),
      ),
      body: Center(
        child: joke == null
            ? CircularProgressIndicator()
            : Text(
          joke!,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
