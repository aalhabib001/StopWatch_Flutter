import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Timer"),
        backgroundColor: Colors.teal,
      ),
      body: MainTimer(),
    ),
  ));
}

class MainTimer extends StatefulWidget {
  @override
  _MainTimerState createState() => _MainTimerState();
}

class _MainTimerState extends State<MainTimer> {
  var stw = new Stopwatch();
  int mili=0,sec=0,min=0,hour=0;

  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start ==59) {
            _start-=59;
            min++;
          } else {
            _start = _start + 1;
          }
          if(min==60){
            hour++;
            min-=60;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Text(
            '$hour:$min:$_start',
            style: TextStyle(
              fontSize: 80.0,
            ),
          ),
          SizedBox(
            height: 200.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  iconSize: 100.0,
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      startTimer();
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.pause),
                  iconSize: 90.0,
                  color: Colors.blue,
                  onPressed: () {
                    _timer.cancel();
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.stop),
                  iconSize: 100.0,
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      hour=0;
                      min=0;
                      _start=0;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
