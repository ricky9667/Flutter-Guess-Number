import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.0),
              Text(
                'About',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.indigo[800],
                ),
              ),
              SizedBox(height: 40.0),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/about_avatar.png'),
              ),
              SizedBox(height: 40.0),
              Card(
                color: Colors.blue[800],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  title: Text(
                    '名字',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                color: Colors.brown[600],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Colors.white,
                  ),
                  title: Text(
                    '系級',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                color: Colors.green[700],
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  title: Text(
                    '信箱',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              RaisedButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text('離開'),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
