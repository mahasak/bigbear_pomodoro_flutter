import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

enum FlipDirection { up, down }

class FlipWidget extends StatelessWidget {
  Widget child;
  final int digit;
  final FlipDirection direction;

  FlipWidget({Key key, this.child, this.digit, this.direction})
      : super(key: key);

  String padZero(int num) => (num < 10) ? "0$num" : "$num";

  String calculatePrevious(
      int digit, FlipDirection direction, int triggerValue) {
    int previousDigit = (direction == FlipDirection.up)
        ? digit - 1
        : (digit == 0) ? 0 : digit + 1;

    previousDigit = (direction == FlipDirection.down && previousDigit == 60)
        ? 0
        : previousDigit;

    return (direction == FlipDirection.down)
        ? padZero(previousDigit)
        : padZero((previousDigit == -1) ? triggerValue - 1 : previousDigit);
  }

  @override
  Widget build(BuildContext context) {

    Widget currentDigit = Text(
      padZero(digit),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 80.0, color: Colors.white),
    );

    Widget previousDigit = Text(
      calculatePrevious(digit, direction, 60),
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 80.0, color: Colors.white),
    );

    return Container(
        alignment: Alignment.center,
        width: 135.0,
        height: 128.0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          
          ClipRect(
              child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: currentDigit,
          )),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
          ),
          ClipRect(
              child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: currentDigit,
          )),
        ]));
  }
}
