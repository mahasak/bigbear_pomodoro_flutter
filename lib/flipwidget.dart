import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class FlipUnit<T> extends StatefulWidget {
  @override
  FlipUnitState<T> createState() => FlipUnitState<T>();
}

class FlipUnitState<T> extends State<FlipUnit>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  int _current, _next;
  DateTime current;
  Timer timer;

  bool active;

  bool countdownMode = false;
  Duration timeLeft;
  VoidCallback onDone;
  

  StreamSubscription<DateTime> _subscription;
  Stream<DateTime> timeStream;

  var time = DateTime.now();

  @override
  void initState() {
    super.initState();
    setState(() {
      _current = 60;
    });
    active = false;

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (_current == 0) {
        timer.cancel();
      } else {
        setState(() {
          _current -= 1;
        });
      }
    });

    final initStream =
        Stream<DateTime>.periodic(Duration(milliseconds: 1000), (_) {
      var oldTime = time;
      (countdownMode)
          ? timeLeft = timeLeft - Duration(seconds: 1)
          : oldTime = oldTime.add(Duration(seconds: 1));

      if (!countdownMode && oldTime.day != time.day) {
        time = oldTime;
        if (onDone != null) onDone();
      }
      log(time.toString());
      return time;
    });

    timeStream =
        (countdownMode ? initStream.take(timeLeft.inSeconds) : initStream)
            .asBroadcastStream();

    _subscription = timeStream.distinct().listen((value) {
      setState(() {
        current = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_current, $currentDate",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 80.0, color: Colors.black),
    );
  }
}
