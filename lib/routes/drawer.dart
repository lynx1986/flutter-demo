import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Demo')),
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.black12,
        ),
        child: buideWidgetItems(context)
      ),
      drawer: buildDrawer(context),
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    return Builder(
      builder: (BuildContext context) {
        return FlatButton(
          child: Text('打开'),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Text('Drawer');
  }
}