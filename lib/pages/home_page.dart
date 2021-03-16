import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_guess_number/pages/about_page.dart';
import 'package:flutter_guess_number/pages/game_page.dart';

class Home extends StatelessWidget {
  static final routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 160.0,
                image: AssetImage('assets/guess_number_logo.png'),
              ),
              SizedBox(height: 48.0),
              Text(
                '猜猜',
                style: TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'JustFont',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[600],
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                'Guess Guess',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'JustFont',
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 60.0),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, Game.routeName);
                  },
                  icon: Icon(Icons.play_arrow, color: Colors.black),
                  label: Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: 'JustFont',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: 300.0,
                height: 60.0,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, About.routeName);
                  },
                  icon: Icon(Icons.info, color: Colors.black),
                  label: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: 'JustFont',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120.0),
            ],
          ),
        ),
      ),
    );
  }
}
