import 'package:flutter/material.dart';

class TitleDetailsPage extends StatelessWidget {
  final Map<String, dynamic> title;

  const TitleDetailsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title['titleText']['text'] ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title['primaryImage'] != null)
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  title['primaryImage']['url'],
                  height: 500,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              'Tipo: ${title['titleType']?['text'] ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Gênero: ${title['genres']?.join(', ') ?? ''}'),
            const SizedBox(height: 8.0),
            Text('Ano de lançamento: ${title['releaseYear']?['year'] ?? ''}'),
            const SizedBox(height: 8.0),
            Text('Sinopse: ${title['synopsis']?['text'] ?? ''}'),
            const SizedBox(height: 8.0),
            Text('Classificação: ${title['rating']?['text'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}
