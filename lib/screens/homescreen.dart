import 'package:flutter/material.dart';
import '../services/apiservices.dart';
import '../widgets/jokecard.dart';
import 'jokesscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();
  late Future<List<String>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = apiService.getJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Types'),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () {
              Navigator.pushNamed(context, '/randomJoke');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((type) => JokeCard(
                        title: type,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JokesScreen(type: type),
                            ),
                          );
                        },
                      ))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
