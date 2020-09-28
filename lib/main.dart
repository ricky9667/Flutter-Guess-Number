import 'package:flutter/material.dart';
import 'package:flutter_guess_number/pages/about_page.dart';
import 'package:flutter_guess_number/pages/game_page.dart';
import 'package:flutter_guess_number/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.routeName,
      routes: {
        Home.routeName: (context) => Home(),
        Game.routeName: (context) => Game(),
        About.routeName: (context) => About(),
      },
    );
  }
}
