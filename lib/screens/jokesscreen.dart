import 'package:flutter/material.dart';
import '../services/apiservices.dart';
import '../models/joke.dart';

class JokesScreen extends StatelessWidget {
  final String type;

  JokesScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: apiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((joke) => ListTile(
                        title: Text(joke.setup),
                        subtitle: Text(joke.punchline),
                      ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
