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
  Timer timer;

  bool active;

  @override
  void initState() {
    print("init state");
    active = false;
    _current = 0;
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      print("data: $_current");
      _current += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "$_current",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 80.0, color: Colors.white),
    );
  }
}
