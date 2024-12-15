import 'package:flutter/material.dart';
import 'package:jokeapp/services/apiservices.dart';
import '../models/joke.dart';

class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
      ),
      body: FutureBuilder<Joke>(
        future: apiService.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.setup,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    snapshot.data!.punchline,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
