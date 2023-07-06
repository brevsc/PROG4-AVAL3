import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getGenres() async {
  const String apiKey = 'a44940f93amsh9b10da3b92d3b22p1a5263jsn2e779825a041';
  const String url =
      'https://moviesdatabase.p.rapidapi.com/titles/utils/genres';

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    },
  );

  if (response.statusCode == 200) {
    final	Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to fetch genres');
  }
}
