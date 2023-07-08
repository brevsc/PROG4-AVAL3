import 'package:flutter/material.dart';
import '../screens/about_us.dart';
import '../screens/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int feed = 0;
  int team = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Catálogo'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Time'),
      ],
      onTap: (int index) => {
        if (index == team)
          {
            setState(() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage())))
          }
        else
          {
            setState(() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage())))
          }
      },
    );
  }
}
