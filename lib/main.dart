import 'package:flutter/material.dart';
import 'package:flutter_guess_number/pages/about_page.dart';
import 'package:flutter_guess_number/pages/game_page.dart';
import 'package:flutter_guess_number/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => const Home(),
        Game.routeName: (context) => const Game(),
        About.routeName: (context) => const About(),
      },
    );
  }
}
