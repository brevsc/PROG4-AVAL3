import 'package:flutter/material.dart';
import '../utils/get_genres.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchGenres();
  }

  Map<String, dynamic>? genresData;
	List<dynamic>? genres;

  Future<void> fetchGenres() async {
    try {
      final Map<String, dynamic> data = await getGenres();
      setState(() {
        genresData = data;
      });
    } catch (error) {
      print('Erro ao buscar os gêneros: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: genresData != null
            ? Text('${genresData!.values}')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
