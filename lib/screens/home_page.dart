import 'package:flutter/material.dart';
import '../widgets/bottom_navigator.dart';
import '/screens/title_details_page.dart';
import '../utils/get_titles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic>? titles;

  @override
  void initState() {
    super.initState();
    fetchTitles();
  }

  Future<void> fetchTitles() async {
    try {
      final Map<String, dynamic> data = await getTitles(10);
      setState(() {
        titles = data['results'];
      });
    } catch (error) {
      print('Error fetching titles: $error');
    }
  }

  void navigateToDetailsPage(Map<String, dynamic> title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TitleDetailsPage(title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: titles != null
            ? Column(
              children: [
                Expanded(
                    child: ListView.builder(
                      itemCount: titles!.length,
                      itemBuilder: (context, index) {
                        final title = titles![index];
                        return ListTile(
                          title: Text(title['titleText']['text'] ?? ''),
                          subtitle: Text(title['titleType']['text'] ?? ''),
                          onTap: () => navigateToDetailsPage(title),
                        );
                      },
                    ),
                  ),
              ],
            )
            : const CircularProgressIndicator()
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
