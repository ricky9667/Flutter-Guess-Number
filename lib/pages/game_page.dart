import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Game extends StatefulWidget {
  static final routeName = '/game';

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  TextEditingController _controller;
  List<int> numbers;
  Random r = Random();
  bool isPlaying;
  int answer;
  int guess;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    numbers = [];
    initGame();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initGame() {
    setState(() {
      answer = r.nextInt(100) + 1;
      numbers.clear();
      isPlaying = true;
    });
    print('answer = $answer');
  }

  void guessNumber() {
    String data = _controller.text.trim();
    int _number;

    setState(() {
      _controller.text = '';

      if (!data.contains(RegExp('^[0-9]*\$'))) {
        return;
      }
      _number = int.parse(data);

      if (_number > 100 || _number <= 0) {
        return;
      }

      numbers.add(_number);
      if (_number == answer) {
        isPlaying = false;
      }
    });
  }

  Future<void> _showRestartDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('重新開始遊戲'),
            content: Text('你確定要重新開始遊戲嗎？'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  initGame();
                  Navigator.pop(context);
                },
                child: Text(
                  '確定',
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              ),
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
            content: Text('你確定要離開遊戲嗎？'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  '確定',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '猜 1 ~ 100 中的數字',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JustFont',
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 5.0,
                child: Container(
                  height: 320.0,
                  child: ListView.builder(
                    padding: EdgeInsets.all(2.0),
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        leading: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text('${numbers[index]}'),
                        trailing: numbers[index] == answer
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.clear, color: Colors.red),
                        onTap: () {
                          if (numbers[index] > answer) print('數字太大');
                          if (numbers[index] < answer) print('數字太小');
                          if (numbers[index] == answer) print('正確');
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 320.0,
                child: TextField(
                  enabled: isPlaying,
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.arrow_forward),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.touch_app, color: Colors.blue),
                      onPressed: guessNumber,
                    ),
                    hintText: '輸入數字',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: _showLeaveDialog,
                    icon: Icon(Icons.arrow_back),
                    label: Text('離開遊戲'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _showRestartDialog,
                    icon: Icon(Icons.refresh),
                    label: Text('重新開始'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
