import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> numberList = []; // list of numbers the player guess
  TextEditingController guessController =
      new TextEditingController(); // controller for guessed number
  bool isPlaying; // if the game is playing or stopped
  String message = '?'; // message on the top board
  int range = 100; // player guesses number range from 1 ~ range
  int answer = 0;

//  _GameState() {
//    startGame();
//  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    // get random answer
    var rand = Random();
    answer = rand.nextInt(range) + 1;

    // reset previous game data
    numberList.clear();
    isPlaying = true; // change game state
    guessController.text = '';
    message = '';
  }

  void endGame() {
    isPlaying = false; // change game state
    message = '答案正確';
  }

  void guessNumber() {
    // get and process TextField data
    String data = guessController.text.trim();
    int _number = int.parse(data);

    setState(() {
      guessController.text = '';

      // identify guessed number and show message
      if (_number > range || _number <= 0) {
        message = '輸入不在範圍內';
        return;
      }

      numberList.add(_number);
      if (_number > answer)
        message = '數字太大了';
      else if (_number < answer)
        message = '數字太小了';
      else
        endGame();
    });
  }

  Future<void> _showRestartDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('重新開始'),
            content: SingleChildScrollView(
              child: Text('你確定要重新開始遊戲嗎？'),
            ),
            actions: [
              FlatButton(
                child: Text('取消', style: TextStyle(color: Colors.grey)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('重新開始'),
                onPressed: () {
                  startGame();
                  setState(() {});
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  Future<void> _showLeaveDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('離開遊戲'),
            content: SingleChildScrollView(
              child: Text('你確定要離開遊戲畫面嗎？'),
            ),
            actions: [
              FlatButton(
                child: Text('取消', style: TextStyle(color: Colors.grey)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('離開'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: SingleChildScrollView(
        child: SafeArea(
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
                    width: 240.0,
                    height: 80.0,
                    margin: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 28.0,
                          fontFamily: 'JustFont',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  '猜一個 1 ~ $range 的數字',
                  style: TextStyle(
                    color: Colors.indigo[700],
                    fontSize: 28.0,
                    fontFamily: 'JustFont',
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        width: 120.0,
                        child: TextField(
                          enabled: isPlaying,
                          keyboardType: TextInputType.number,
                          controller: guessController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.arrow_forward),
                            hintText: '輸入數字',
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: RaisedButton.icon(
                        icon: Icon(Icons.touch_app),
                        label: Text(
                          '猜',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'JustFont',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.lightGreen,
                        onPressed: isPlaying ? guessNumber : null,
                      ),
                    ),
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
                      height: 280.0,
                      padding: EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: numberList.length,
                        itemBuilder: (context, index) {
                          int reversedIndex = numberList.length - index - 1;
                          return ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            leading: Text(
                              '${reversedIndex + 1}.',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            title: Text(numberList[reversedIndex].toString()),
                            trailing: numberList[reversedIndex] == answer
                                ? Icon(Icons.check, color: Colors.green)
                                : Icon(Icons.clear, color: Colors.red),
                            onTap: () {},
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
                      label: Text(
                        '離開遊戲',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'JustFont',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: _showLeaveDialog,
                    ),
                    RaisedButton.icon(
                      icon: Icon(Icons.refresh),
                      label: Text(
                        '重新開始',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'JustFont',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: _showRestartDialog,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
