import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';

class ButtonDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button Demo')),
      body: buideWidgetItems(context),
      floatingActionButton: FloatingActionButton(
        child: Text('Float'),
        onPressed: () {},
      ),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'RaisedButton'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text('Button'),
                onPressed: () {},
              ),
              RaisedButton.icon(
                label: Text('Delete'),
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'FlatButton'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('Button'),
                onPressed: () {},
              ),
              FlatButton.icon(
                label: Text('Delete'),
                icon: Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            ],
          ),
        ),
        
        Header(title: 'IconButton'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete, color: Colors.orange),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'OutlineButton'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlineButton(
                padding: new EdgeInsets.all(8.0),
                borderSide: BorderSide(color: Colors.orange),
                child: Icon(Icons.delete, color: Colors.orange),
                shape: CircleBorder(),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'Image Button'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: CircleBorder(),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: Image.asset(
                    Constants.PLAYERS[0]['headimg'], 
                    width: 40.0, height: 40.0, fit: BoxFit.fill
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'ButtonBar'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ButtonBar(
                children: <Widget>[
                  RaisedButton(
                    child: Text('Raised1'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('Raised2'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('Raised3'),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ),
        Header(title: 'Color'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: Text('Flat'),
                onPressed: () {},
              ),
              RaisedButton(
                textColor: Colors.orange,
                child: Text('Raised'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'Corner'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                color: Colors.orange,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  side: BorderSide(color: Colors.orange, width: 1)
                ),
                child: Text('Flat'),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.orange,
                textColor: Colors.white,
                shape: StadiumBorder(),
                child: Text('Raised'),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.orange,
                textColor: Colors.white,
                shape: CircleBorder(),
                child: Text('R'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Header(title: 'Border'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                textColor: Colors.orange,
                shape: BeveledRectangleBorder(
                  side: BorderSide(color: Colors.orange, width: 1)
                ),
                child: Text('Flat'),
                onPressed: () {},
              ),
              RaisedButton(
                textColor: Colors.orange,
                shape: BeveledRectangleBorder(
                  side: BorderSide(color: Colors.orange, width: 4)
                ),
                child: Text('Raised'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}