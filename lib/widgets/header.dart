import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  const Header({
    Key key,
    this.title,
    this.titleStyle,
    this.padding,
    this.bgColor,
    this.alignment
  }) : assert(title != null),
       super(key: key);

  final String title;
  final TextStyle titleStyle;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: alignment == null ? Alignment.centerLeft : alignment,
      color: bgColor == null ? Colors.transparent : bgColor,
      padding: padding == null ? EdgeInsets.fromLTRB(0, 12.0, 0, 6.0) : padding,
      child: Text(
        title == null ? 'H' : title,
        style: titleStyle == null ? TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600) : titleStyle
      ),
    );
  }
}