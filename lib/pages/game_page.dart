import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Game extends StatefulWidget {
  static final routeName = '/game';

  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final TextEditingController _controller = TextEditingController();
  final List<int> numbers = [];
  final Random r = Random();
  bool isPlaying = false;
  int answer = 0;
  int guess = 0;

  @override
  void initState() {
    super.initState();
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
      _controller.text = '';
      isPlaying = true;
    });
    ToastContext().init(context);
    if (kDebugMode) {
      print('answer = $answer');
    }
  }

  void _showHintToast(int num) {
    final String message;
    final Color toastColor;

    if (num == answer) {
      message = '答案正確！';
      toastColor = Colors.green;
    } else if (num > answer) {
      message = '數字太大了！';
      toastColor = Colors.red;
    } else if (num < answer) {
      message = '數字太小了！';
      toastColor = Colors.red;
    } else {
      message = '輸入格式有誤';
      toastColor = Colors.deepPurple[300]!;
    }
    Toast.show(
      message,
      duration: Toast.lengthShort,
      gravity: Toast.bottom,
      backgroundColor: toastColor,
    );
  }

  void guessNumber() {
    String data = _controller.text.trim();
    setState(() {
      _controller.text = '';
      if (data.contains(RegExp('^[0-9]*\$'))) {
        int num = int.parse(data);
        // print('num = $num');
        if (num <= 100 && num >= 1) {
          numbers.add(num);
          if (num == answer) {
            isPlaying = false;
          }
        }
        _showHintToast(num);
      } else {
        _showHintToast(-1);
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
              child: Text('取消', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                initGame();
                Navigator.pop(context);
              },
              child: Text('確定', style: TextStyle(color: Colors.cyan)),
            ),
          ],
        );
      },
    );
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
              child: Text('取消', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('確定', style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.lime[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 32.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 8.0,
                    ),
                    child: Text(
                      '猜 1 ~ 100 中的數字',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JustFont',
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8.0,
                    child: SizedBox(
                      height: 240.0,
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
                            trailing:
                                numbers[index] == answer
                                    ? Icon(Icons.check, color: Colors.green)
                                    : Icon(Icons.clear, color: Colors.red),
                            onTap: () {
                              _showHintToast(numbers[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 48.0,
                      horizontal: 8.0,
                    ),
                    width: 320.0,
                    child: TextField(
                      enabled: isPlaying,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.arrow_forward),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.touch_app, color: Colors.blue),
                          onPressed: isPlaying ? guessNumber : null,
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
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        label: Text(
                          '離開遊戲',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _showRestartDialog,
                        icon: Icon(Icons.refresh, color: Colors.black),
                        label: Text(
                          '重新開始',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
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
        ),
      ),
    );
  }
}
