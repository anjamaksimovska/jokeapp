import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  JokeCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
