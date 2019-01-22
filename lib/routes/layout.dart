import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout Demo')),
      body: buideWidgetItems(context),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    const padding = EdgeInsets.all(6.0);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      children: <Widget>[
        Header(title: 'Row'),
        Display(
          child: Row(
            children: <Widget>[
              Container(padding: padding, color: Colors.red, child: Text('red')),
              Container(padding: padding, color: Colors.yellow, child: Text('yellow')),
              Container(padding: padding, color: Colors.blue, child: Text('blue')),
            ],
          ),
        ),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(padding: padding, color: Colors.red, child: Text('red')),
              Container(padding: padding, color: Colors.yellow, child: Text('yellow')),
              Container(padding: padding, color: Colors.blue, child: Text('blue')),
            ],
          ),
        ),
        Display(
          child: Row(
            children: <Widget>[
              Container(padding: padding, color: Colors.red, child: Text('red')),
              Expanded( child: Container(padding: padding, color: Colors.yellow, child: Text('yellow'))),
              Container(padding: padding, color: Colors.blue, child: Text('blue')),
            ],
          ),
        ),
        Display(
          child: Row(
            children: <Widget>[
              Expanded( child: Container(padding: padding, alignment: Alignment.center, color: Colors.red, child: Text('red'))),
              Expanded( child: Container(padding: padding, alignment: Alignment.center, color: Colors.yellow, child: Text('yellow'))),
              Expanded( child: Container(padding: padding, alignment: Alignment.center, color: Colors.blue, child: Text('blue'))),
            ],
          ),
        ),
        Display(
          child: Row(
            children: <Widget>[
              Expanded( child: Container(padding: padding, margin: padding, alignment: Alignment.center, color: Colors.red, child: Text('red'))),
              Expanded( child: Container(padding: padding, margin: padding, alignment: Alignment.center, color: Colors.yellow, child: Text('yellow'))),
              Expanded( child: Container(padding: padding, margin: padding, alignment: Alignment.center, color: Colors.blue, child: Text('blue'))),
            ],
          ),
        ),
        Display(
          child: Row(
            children: <Widget>[
              Container(padding: padding, color: Colors.red, child: Text('red')),
              Expanded(child: Text('')),
              Container(padding: padding, color: Colors.yellow, child: Text('yellow')),
              Container(padding: padding, color: Colors.blue, child: Text('blue')),
            ],
          ),
        ),
        Display(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded( child: Container(padding: padding, alignment: Alignment.center, color: Colors.red, child: Text('red'))),
              Expanded( child: Container(padding: padding, height: 60, alignment: Alignment.center, color: Colors.yellow, child: Text('yellow'))),
              Expanded( child: Container(padding: padding, alignment: Alignment.center, color: Colors.blue, child: Text('blue'))),
            ],
          ),
        ),
        Display(
          child: Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(padding: padding, alignment: Alignment.center, color: Colors.red, child: Text('red')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Container(padding: padding, alignment: Alignment.center, color: Colors.yellow, child: Text('yellow'))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(padding: padding, alignment: Alignment.center, color: Colors.green, child: Text('green')),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(padding: padding, alignment: Alignment.center, color: Colors.blue, child: Text('blue')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Header(title: 'Column'),
        Container(
          height: 200.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Display(
                child: Column(
                  children: <Widget>[
                    Container(padding: padding, color: Colors.red, child: Text('red')),
                    Container(padding: padding, color: Colors.yellow, child: Text('yellow')),
                    Container(padding: padding, color: Colors.blue, child: Text('blue')),
                  ],
                ),
              ),
              Display(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(padding: padding, color: Colors.red, child: Text('red')),
                    Expanded(child: Container(padding: padding, color: Colors.yellow, child: Text('yellow'))),
                    Container(padding: padding, color: Colors.blue, child: Text('blue')),
                  ],
                ),
              ),
              Display(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(child: Container(padding: padding, alignment: Alignment.center, color: Colors.red, child: Text('red'))),
                    Expanded(child: Container(padding: padding, alignment: Alignment.center, color: Colors.yellow, child: Text('yellow'))),
                    Expanded(child: Container(padding: padding, alignment: Alignment.center, color: Colors.blue, child: Text('blue'))),
                  ],
                ),
              ),
              Display(
                child: Column(
                  children: <Widget>[
                    Container(padding: padding, color: Colors.red, child: Text('red')),
                    Expanded(child: Text('')),
                    Container(padding: padding, color: Colors.yellow, child: Text('yellow')),
                    Container(padding: padding, color: Colors.blue, child: Text('blue')),
                  ],
                ),
              ),
            ],
          )
        ),
        Header(title: 'Stack'),
        Display(
          child: Stack(
            children: <Widget>[
              Image.asset(Constants.PLAYERS[0]['headimg']),
              Positioned(
                bottom: 0.0, left: 0.0, right: 0.0,
                child: Container(
                  color: Colors.black45, padding: padding,
                  alignment: Alignment.bottomCenter,
                  child: Text('底部居中', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              Positioned(
                top: 0.0, left: 0.0,
                child: Container(
                  color: Colors.black45, padding: padding,
                  child: Text('左上', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              Positioned(
                top: 0, left: 0, right: 0, bottom: 0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container (
                      color: Colors.black45, padding: padding,
                      child: Text('居中', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  )
                ),
              ),
              Positioned(
                top: 0, left: 0, right: 0, bottom: 0,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container (
                      color: Colors.black45, padding: padding,
                      child: Text('居右', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  )
                ),
              ),
              Positioned(
                top: 60, left: 60,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container (
                      color: Colors.black45, padding: padding,
                      child: Text('60, 60', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Flow'),
        Display(
          height: 240.0,
          child: Center(
            child: Flow(
              delegate: FlowDelegateDemo(margin: EdgeInsets.all(6.0)),
              children: Constants.PLAYERS.map((player) {
                int index = Constants.PLAYERS.indexOf(player);
                double size = (index*0.1 + 1) * 60.0;
                return Image.asset(player['headimg'], width: size, height: size, fit: BoxFit.fill);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class FlowDelegateDemo extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  FlowDelegateDemo({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}