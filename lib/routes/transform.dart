import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';
import 'package:flutterdemo/widgets/hint.dart';

class TransformDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transform Demo')),
      body: buideWidgetItems(context),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    Widget demoImage = Image.asset(Constants.PLAYERS[0]['headimg'], width: 50, height: 50, fit: BoxFit.fill);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'X轴偏斜'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.skewX(0.6),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.skewX(-0.6),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Y轴偏斜'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.skewY(0.1),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.skewY(-0.1),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: 'X轴旋转'),
        Hint(text: '绕X轴分别旋转45度和135度'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi/4),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(-math.pi * 3/4),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Y轴旋转'),
        Hint(text: '绕Y轴分别旋转45度，135度及180度'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi/4),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi * 3/4),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Z轴旋转'),
        Hint(text: '绕Z轴分别旋转45度和135度'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform(
                  transform: Matrix4.rotationZ(math.pi/4),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(-math.pi * 3/4),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: '缩放'),
        Hint(text: '缩放0.5、0.9和1.2倍'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform.scale(
                  scale: 0.5,
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 0.9,
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: 1.2,
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
        Header(title: '移动'),
        Hint(text: '原位，上移6，下移6'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                // child: demoImage,
                child: Transform.translate(
                  offset: Offset(0, 0),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: Offset(0, -6),
                  child: demoImage,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Transform.translate(
                  offset: Offset(0, 6),
                  child: demoImage,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}