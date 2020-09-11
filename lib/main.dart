import 'package:flutter/material.dart';
import 'package:flutter_guess_number/pages/about_page.dart';
import 'package:flutter_guess_number/pages/game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/game',
      routes: {
        '/game': (context) => Game(),
        '/about': (context) => About(),
      },
    );
  }
}
