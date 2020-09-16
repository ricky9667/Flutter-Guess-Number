import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<int> numberList = [];
  TextEditingController guessController = new TextEditingController();
  String message = '?';
  int range = 100;
  int answer = 0;

  _GameState() {
    startGame();
  }

  void startGame() {
    answer = getRandomNumber(range);
    numberList.clear();

    guessController.text = '';
    message = '?';

    print('answer = $answer');
  }

  void endGame() {
    message = '答案正確';
  }

  void guessNumber(int _number) {
    guessController.text = '';
    if (_number > range || _number <= 0) {
      message = '輸入不在範圍內';
      return;
    }

    numberList.add(_number);
    if (_number > answer) message = '數字太大了';
    else if (_number < answer) message = '數字太小了';
    else endGame();
  }

  int getRandomNumber(int range) {
    var rand = new Random();
    return rand.nextInt(range) + 1;
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
                          fontSize: 28.0,
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
                        controller: guessController,
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
                        child: Text('猜'),
                        onPressed: () {
                          int _guess = int.parse(guessController.text);
                          print(_guess);
                          guessNumber(_guess);
                          setState(() {});
                        },
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
                        itemCount: numberList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                              '${index+1}.',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            title: Text(numberList[index].toString()),
                            trailing: numberList[index] == answer
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
      ),
    );
  }
}
