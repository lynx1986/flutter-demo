import 'package:flutter/material.dart';

class Hint extends StatelessWidget {

  const Hint({
    Key key,
    this.text,
  }) : assert(text != null),
    super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[200],
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: TextStyle(color: Colors.blueGrey, fontStyle: FontStyle.italic))
    );
  }
}