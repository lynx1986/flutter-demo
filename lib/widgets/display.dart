import 'package:flutter/material.dart';

class Display extends StatelessWidget {

  const Display({
    Key key,
    this.child,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
  }) : assert(child != null),
    super(key: key);

  final Widget child;
  final Color color;
  final Color borderColor;
  final Radius borderRadius;
  final height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {

    if (height == null) {
      return Container(
        decoration: BoxDecoration(
          color: color == null ? Colors.grey[200] : color,
          border: Border.all(color: borderColor == null ? Colors.black45 : borderColor),
          borderRadius: BorderRadius.all(borderRadius == null ? Radius.circular(4) : borderRadius)
        ),
        padding: padding == null ? EdgeInsets.all(8.0) : padding,
        margin: EdgeInsets.only(bottom: 8.0),
        child: child,
      );
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color == null ? Colors.grey[200] : color,
        border: Border.all(color: borderColor == null ? Colors.black45 : borderColor),
        borderRadius: BorderRadius.all(borderRadius == null ? Radius.circular(4) : borderRadius)
      ),
      padding: padding == null ? EdgeInsets.all(8.0) : padding,
      margin: EdgeInsets.only(bottom: 8.0),
      child: child,
    );
  }
}