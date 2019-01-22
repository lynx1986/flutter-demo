import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';

class ImageDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Demo')),
      body: buideWidgetItems(context),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'Image from asset'),
        Display(
          child: Image.asset(Constants.PLAYERS[1]['headimg']),
        ),
        Header(title: 'Image from web'),
        Display(
          child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547704637724&di=9331a3989eb67e0113e8061f24401657&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png"),
        ),
        Header(title: 'Image from file system'),
        Display(
          child: Text("TODO"),
        ),
        Header(title: 'Images'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(Constants.PLAYERS[2]['headimg'], width: 80, height: 80, fit: BoxFit.fill),
              Image.asset(Constants.PLAYERS[3]['headimg'], width: 80, height: 80, fit: BoxFit.fill),
              Image.asset(Constants.PLAYERS[4]['headimg'], width: 80, height: 80, fit: BoxFit.fill),
            ],
          )
        ),
        Header(title: 'Fit'),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg']),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], fit: BoxFit.fitWidth),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], fit: BoxFit.cover),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], fit: BoxFit.fill),
        ),
        Header(title: 'Alignment'),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.centerLeft),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.center),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.centerRight),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.topLeft, fit: BoxFit.fitWidth),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.center, fit: BoxFit.fitWidth),
        ),
        Display(
          height: 160.0,
          child: Image.asset(Constants.PLAYERS[2]['headimg'], alignment: Alignment.bottomRight, fit: BoxFit.fitWidth),
        ),
        Header(title: 'Color Blend'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(Constants.PLAYERS[0]['headimg'], 
                width: 80, height: 80, fit: BoxFit.fill, color: Colors.yellow, colorBlendMode: BlendMode.colorBurn,
              ),
              Image.asset(Constants.PLAYERS[0]['headimg'], 
                width: 80, height: 80, fit: BoxFit.fill, color: Colors.yellow, colorBlendMode: BlendMode.colorDodge,
              ),
              Image.asset(Constants.PLAYERS[0]['headimg'], 
                width: 80, height: 80, fit: BoxFit.fill, color: Colors.yellow, colorBlendMode: BlendMode.lighten,
              ),
            ],
          ),
        ),
      ],
    );
  }
}