import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final List<String> items = ['C++', 'Dart', 'Python', 'Java', 'Kotlin'];

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
              SizedBox(height: 40.0),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  border: Border.all(
                    color: Colors.deepPurple,
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                  shape: BoxShape.rectangle,
                ),
                child: Container(
                  width: 180.0,
                  height: 100.0,
                  margin: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '?',
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                '猜一個 1 ~ 100 的數字',
                style: TextStyle(
                  color: Colors.indigo[700],
                  fontSize: 28.0,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Spacer(),
                  Flexible(
                    flex: 3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: null,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.arrow_forward),
                        hintText: '輸入數字',
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('猜'),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 40.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5.0,
                  child: Container(
                    height: 240.0,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.check),
                          // X => Icons.clear or Icons.close
                          title: Text('Item ${index.toString()}'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RaisedButton.icon(
                    icon: Icon(Icons.arrow_back),
                    label: Text('離開遊戲'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.refresh),
                    label: Text('重新開始'),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
