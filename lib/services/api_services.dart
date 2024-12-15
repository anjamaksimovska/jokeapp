import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://official-joke-api.appspot.com';

  // Fetch a random joke
  static Future<String> getRandomJoke() async {
    final response = await http.get(Uri.parse('$baseUrl/random_joke'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return '${data['setup']} - ${data['punchline']}';
    } else {
      throw Exception('Failed to load random joke');
    }
  }

  // Fetch jokes by type
  static Future<List<String>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse('$baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map<String>((joke) => '${joke['setup']} - ${joke['punchline']}').toList();
    } else {
      throw Exception('Failed to load jokes by type');
    }
  }
}
