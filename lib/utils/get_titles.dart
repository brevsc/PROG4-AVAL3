import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> getTitles(int amount) async {
  const String apiKey = 'f509e5c1a3mshb2f3dc20f23aa8ep1ab2b0jsnb53b327bf2f2';
  final String url = 'https://moviesdatabase.p.rapidapi.com/titles?limit=$amount';

  final Uri uri = Uri.parse(url).replace(queryParameters: {'info': 'base_info', 'year': '2023'});

  final response = await http.get(
    uri,
    headers: {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to fetch titles');
  }
}
