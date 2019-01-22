import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';

class TextDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Demo')),
      body: buideWidgetItems(context),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    TextStyle style = new TextStyle(fontSize: 20.0);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'Text Size'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('size: 16', style: style.merge(TextStyle(fontSize: 16))),
              Text('size: 20', style: style),
              Text('size: 24', style: style.merge(TextStyle(fontSize: 24))),
              Text('size: 28', style: style.merge(TextStyle(fontSize: 28))),
            ],
          ),
        ),
        Header(title: 'Text Color'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('orange', style: style.merge(TextStyle(color: Colors.orange))),
              Text('cyan', style: style.merge(TextStyle(color: Colors.cyan))),
              Text('brown', style: style.merge(TextStyle(color: Colors.brown))),
              Text('blue', style: style.merge(TextStyle(color: Colors.blue))),
            ],
          ),
        ),
        Header(title: 'Text Style'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('italic', style: style.merge(TextStyle(fontStyle: FontStyle.italic))),
              Text('bold', style: style.merge(TextStyle(fontWeight: FontWeight.bold))),
              Text('Courier', style: style.merge(TextStyle(fontFamily: 'Courier'))),
            ],
          ),
        ),
        Header(title: 'Text Decoration'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('linethrough', style: style.merge(TextStyle(
                decorationColor: Colors.green, 
                decorationStyle: TextDecorationStyle.solid,
                decoration: TextDecoration.lineThrough
              ))),
              Text('overline', style: style.merge(TextStyle(
                decorationColor: Colors.blue, 
                decorationStyle: TextDecorationStyle.dashed,
                decoration: TextDecoration.overline
              ))),
              Text('underline', style: style.merge(TextStyle(
                decorationColor: Colors.pink, 
                decorationStyle: TextDecorationStyle.dotted,
                decoration: TextDecoration.underline
              ))),
            ],
          ),
        ),
        Header(title: 'Text Spacing'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Let\'s go', style: style),
              Text('Let\'s go', style: style.merge(TextStyle(wordSpacing: 18.0))),
              Text('Let\'s go', style: style.merge(TextStyle(letterSpacing: 4.0, color: Colors.indigo))),
            ],
          ),
        ),
        Header(title: 'Text Wrap'),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Display(
              child: Text(
                'This\'s a litter demo for flutter widgets. Please contact me if there\'s a bug.',  
                style: style.merge(TextStyle(fontSize: 18.0)),
              ),
            ),
            Display(
              child: Text(
                'This\'s a litter demo for flutter widgets. Please contact me if there\'s a bug.',  
                style: style.merge(TextStyle(fontSize: 18.0)),
                overflow: TextOverflow.clip, maxLines: 1,
              ),
            ),
            Display(
              child: Text(
                'This\'s a litter demo for flutter widgets. Please contact me if there\'s a bug.',  
                style: style.merge(TextStyle(fontSize: 18.0)),
                overflow: TextOverflow.ellipsis,  softWrap: false, maxLines: 1,
              ),
            ),
            Display(
              child: Text(
                'This\'s a litter demo for flutter widgets. Please contact me if there\'s a bug.',  
                style: style.merge(TextStyle(fontSize: 18.0)),
                overflow: TextOverflow.fade,  softWrap: false, maxLines: 1,
              ),
            ),
          ],
        ),
        Divider(height: 20.0),
      ],
    );
  }
}