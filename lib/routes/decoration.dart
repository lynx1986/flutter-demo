import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';
import 'package:flutterdemo/widgets/hint.dart';


class DecorationDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoration Demo'),
      ),
      body: buildDemos()
    );
  }

  Widget buildDemos() {

    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Header(title: '边框 - 颜色'),
        buildDecorationItems([
          BoxDecoration(border: Border.all(color: Colors.blue)),
          BoxDecoration(border: Border.all(color: Colors.green)),
          BoxDecoration(border: Border.all(color: Colors.pink)),
          BoxDecoration(border: Border.all(color: Colors.red)),
          BoxDecoration(border: Border.all(color: Colors.teal))
        ]),
        Header(title: '边框 - 粗细'),
        buildDecorationItems([
          BoxDecoration(border: Border.all(width: 0.4)),
          BoxDecoration(border: Border.all(width: 0.8)),
          BoxDecoration(border: Border.all(width: 1.2)),
          BoxDecoration(border: Border.all(width: 1.6)),
          BoxDecoration(border: Border.all(width: 2.0)),
        ]),
        Header(title: '边框 - 方位'),
        Hint(text: '分别设置上下左右的边框',),
        buildDecorationItems([
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue))),
          BoxDecoration(border: Border(top: BorderSide(color: Colors.blue))),
          BoxDecoration(border: Border(left: BorderSide(color: Colors.blue))),
          BoxDecoration(border: Border(right: BorderSide(color: Colors.blue))),
          BoxDecoration(border: Border.all(color: Colors.blue)),
        ]),
        Header(title: '边框 - 圆角'),
        buildDecorationItems([
          BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), 
            border: Border.all(color: Colors.purple)
          ),
          BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(8.0, 30.0)),
            border: Border.all(color: Colors.purple)
          ),
          BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(4), right: Radius.circular(12)), 
            border: Border.all(color: Colors.purple)
          ),
          BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0), topRight: Radius.circular(8.0), 
              bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(16.0)
            ),
            border: Border.all(color: Colors.purple)
          ),
          BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            border: Border.all(color: Colors.purple)
          ),
        ]),
        Header(title: '边框 - 阴影'),
        Hint(text: 'spread会改变阴影大小'),
        buildDecorationItems([
          BoxDecoration(
            border: Border.all(color: Colors.blue),
            color: Colors.lightBlue,
            boxShadow: [
              BoxShadow(color: Colors.blueGrey, offset: Offset(2.0, 4.0), blurRadius: 2.0, spreadRadius: 0)
            ]
          ),
          BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Colors.greenAccent,
            boxShadow: [
              BoxShadow(color: Colors.green, offset: Offset(-2.0, -4.0), blurRadius: 0.0, spreadRadius: 0)
            ]
          ),
          BoxDecoration(
            border: Border.all(color: Colors.pink),
            color: Colors.grey[400],
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(0.0, 4.0))
            ]
          ),
          BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(60.0),
            color: Colors.indigoAccent,
            boxShadow: [
              BoxShadow(color: Colors.indigo, offset: Offset(4.0, 0.0), blurRadius: 1.0)
            ]
          ),
          BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(60.0),
            color: Colors.indigoAccent,
            boxShadow: [
              BoxShadow(color: Colors.indigo, offset: Offset(4.0, 0.0), spreadRadius: 2.0)
            ]
          )
        ]),
        Header(title: '背景图片'),
        Hint(text: '背景图片可用AssetImage或NetworkImage，并使用ColorFilter'),
        buildDecorationItems([
          BoxDecoration(image: DecorationImage(image: AssetImage(Constants.PLAYERS[4]['headimg']))),
          BoxDecoration(image: DecorationImage(
            image: AssetImage(Constants.PLAYERS[4]['headimg']),
            colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.overlay)
          )),
          BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547704637724&di=9331a3989eb67e0113e8061f24401657&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png"),
              colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.overlay)
            ),
          ),
        ]),
        Header(title: '形状'),
        buildDecorationItems([
          BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          BoxDecoration(shape: BoxShape.rectangle, color: Colors.cyan)
        ]),
        Header(title: 'Clip剪切'),
        Hint(text: '使用ClipPath可以剪切任意形状',),
        buildContainerItems([
          ClipOval(child: Container(color: Colors.blue)),
          ClipRect(child: Container(color: Colors.blue)),
          ClipRRect(child: Container(color: Colors.blue), borderRadius: BorderRadius.circular(8.0)),
          ClipRRect(child: Image.asset(Constants.PLAYERS[2]['headimg'], fit: BoxFit.fill), borderRadius: BorderRadius.circular(8.0)),
          ClipPath(child: Image.asset(Constants.PLAYERS[1]['headimg'], fit: BoxFit.fill), clipper: StarCliper(radius: 30.0)),
        ]),
        Header(title: '透明度'),
        buildContainerItems([
          Opacity(opacity: 0.2, child: Container(color: Colors.orange)),
          Opacity(opacity: 0.4, child: Container(color: Colors.orange)),
          Opacity(opacity: 0.6, child: Container(color: Colors.orange)),
          Opacity(opacity: 0.8, child: Container(color: Colors.orange)),
          Opacity(opacity: 1.0, child: Container(color: Colors.orange))
        ])
      ],
    );
  }

  Widget buildContainerItems(List<Widget> items) {
    return Display(
      child: Row(
        children: items.map((item) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 60.0,
              child: item,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDecorationItems(List<BoxDecoration> decorations) {
    return Display(
      child: Row(
        children: decorations.map((decoration) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: 60.0,
              decoration: decoration,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class StarCliper extends CustomClipper<Path>{

  final double radius;

  StarCliper({this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);// 36为五角星的角度
    double radius_in = (radius * Math.sin(radian / 2) / Math
        .cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0);// 此点为多边形的起点
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)),
        (radius + radius_in));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius
            * Math.sin(radian)), (radius + radius
        * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in
        * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.close();// 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(StarCliper oldClipper) {
      return this.radius != oldClipper.radius;
  }

}