import 'package:bigbear_pomodoro/flipunit.dart';
import 'package:bigbear_pomodoro/flipwidget.dart' as prefix0;
import 'package:flutter/material.dart';

import 'flipwidget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flip Unit'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  final bool debugMode = true;
  DateTime now = DateTime.now();
  DateTime dDay = DateTime(2018, 11, 26, 0, 0, 0);

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    dDay = DateTime(now.year, now.month, now.day, now.hour, now.minute+10, now.second);
    
    Duration _duration = dDay.difference(now);

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(child: FlipClock.reverseCountdown(
            duration: _duration,
            flipDirection: prefix0.FlipDirection.down,
            digitColor: Colors.white,
            backgroundColor: Colors.black,
            digitSize: 30.0,
            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
            //onDone: () => print('ih'),
          )));
  }
}
