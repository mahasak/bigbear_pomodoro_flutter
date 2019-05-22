import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class FlipWidget extends StatelessWidget {
  Widget child;

  FlipWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 96.0,
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
            child: child,
          )),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
          ),
          ClipRect(
              child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: child,
          )),
        ]));
  }

  Widget build2(BuildContext ctx) {
    return Container(
        alignment: Alignment.center,
        width: 96.0,
        height: 128.0,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
              alignment: Alignment.center,
              width: 96.0,
              height: 128.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ClipRect(
                  child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: child,
              ))),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                ),
                Container(
              alignment: Alignment.center,
              width: 96.0,
              height: 128.0,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ClipRect(
                  child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: child,
              )))
        ]));
  }
}
