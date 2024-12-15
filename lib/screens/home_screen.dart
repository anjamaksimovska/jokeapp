import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/random_joke');
              },
              child: Text('Get Random Joke'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/jokes_by_type');
              },
              child: Text('Jokes by Type'),
            ),
          ],
        ),
      ),
    );
  }
}
