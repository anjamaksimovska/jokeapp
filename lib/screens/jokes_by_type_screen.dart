import 'package:flutter/material.dart';
import '../services/api_services.dart';

class JokesByTypeScreen extends StatefulWidget {
  @override
  _JokesByTypeScreenState createState() => _JokesByTypeScreenState();
}

class _JokesByTypeScreenState extends State<JokesByTypeScreen> {
  List<String>? jokes;

  @override
  void initState() {
    super.initState();
    _loadJokesByType();
  }

  Future<void> _loadJokesByType() async {
    final fetchedJokes = await ApiService.getJokesByType('programming');
    setState(() {
      jokes = fetchedJokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes by Type"),
      ),
      body: jokes == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: jokes!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jokes![index]),
          );
        },
      ),
    );
  }
}
