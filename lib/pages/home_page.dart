import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.0),
              Image(
                height: 160.0,
                image: AssetImage('assets/guess_number_logo.png'),
              ),
              SizedBox(height: 40.0),
              Text(
                'Flutter 猜數字',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'JustFont',
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[800],
                ),
              ),
              SizedBox(height: 60.0),
              ButtonTheme(
                minWidth: 300.0,
                height: 60.0,
                buttonColor: Colors.lightGreen,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: Icon(Icons.play_arrow),
                  label: Text(
                    'Play',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'JustFont',
                    ),
                  ),
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                ),
              ),
              SizedBox(height: 60.0),
              ButtonTheme(
                minWidth: 300.0,
                height: 60.0,
                buttonColor: Colors.amber,
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: Icon(Icons.info),
                  label: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'JustFont',
                    ),
                  ),
                  elevation: 5.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
