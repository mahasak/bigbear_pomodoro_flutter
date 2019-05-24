import 'package:bigbear_pomodoro/flipunit.dart';
import 'package:flutter/material.dart';

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

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FlipWidget(
              child: Text(
            '00',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
                color: Colors.white),
          ))
            ])));
  }
}
