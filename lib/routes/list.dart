import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';
import 'package:flutterdemo/widgets/hint.dart';

class ListDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Demo'),
      ),
      body: buideWidgetItems(context)
    );
  }

  Widget buideWidgetItems(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      shrinkWrap: true,
      children: <Widget>[
        Header(title: 'ListView - 固定长度'),
        Display(
          height: 400.0,
          child: buildFixSizeList(),
        ),
        Header(title: 'ListView - itemExtent'),
        Hint(text: '设置itemExtent比单独设置每个item的height更有效率。'),
        Display(
          height: 400.0,
          child: ListView(
            itemExtent: 80.0,
            children: Constants.PLAYERS.map((player) {
              return ListTile(
                leading: Image.asset(player['headimg'], width: 50, height: 50, fit: BoxFit.fill),
                title: Text(player['name']),
                subtitle: Text(player['desc']),
                trailing: IconButton(
                  icon: Icon(Icons.favorite_border, size: 30.0, color: Colors.pink),
                  onPressed: () {},
                ),
              );
            }).toList(),
          ),
        ),
        Header(title: '无限长度'),
        Display(
          height: 400.0,
          child: buildEndlessList(),
        ),
        Header(title: '初始位置'),
        Display(
          height: 400.0,
          child: buildFixSizeListForInitialPosition(),
        ),
        Header(title: '滚动控制'),
        Display(
          height: 400.0,
          child: buildListForControl(),
        ),
      ],
    );
    
  }

  Widget buildListForControl() {
    return ControlledListDemo();
  }

  Widget buildEndlessList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, i) {
        final player = Constants.PLAYERS[i%Constants.PLAYERS.length];
        return ListTile(
          leading: Image.asset(player['headimg'], width: 50, height: 50),
          title: Text(player['name']),
          subtitle: Text(player['desc']),
        );
      },
    );
  }

  Widget buildFixSizeListForInitialPosition() {
    return ListView.separated(
      controller: ScrollController(initialScrollOffset: 100.0),
      padding: const EdgeInsets.all(8.0),
      itemCount: Constants.PLAYERS.length,
      itemBuilder: (context, i) {
        final player = Constants.PLAYERS[i];
        return ListTile(
          leading: Image.asset(player['headimg'], width: 50, height: 50),
          title: Text(player['name']),
          subtitle: Text(player['desc']),
          trailing: IconButton(
            icon: Icon(Icons.favorite_border, size: 30.0, color: Colors.pink),
            onPressed: () {},
          ),
        );
      },
      separatorBuilder: (context, i) => Divider(height: 18, color: Colors.grey),
    );
  }

  Widget buildFixSizeList() {
    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: Constants.PLAYERS.length,
      itemBuilder: (context, i) {
        final player = Constants.PLAYERS[i];
        return ListTile(
          leading: Image.asset(player['headimg'], width: 50, height: 50, fit: BoxFit.fill),
          title: Text(player['name']),
          subtitle: Text(player['desc']),
          trailing: IconButton(
            icon: Icon(Icons.favorite_border, size: 30.0, color: Colors.pink),
            onPressed: () {},
          ),
        );
      },
      separatorBuilder: (context, i) => Divider(height: 18, color: Colors.grey),
    );
  }
}

class ControlledListDemo extends StatefulWidget {
  const ControlledListDemo({ Key key }) : super(key: key);
  @override
  ControlledListState createState() => ControlledListState();
}

class ControlledListState extends State<ControlledListDemo> with SingleTickerProviderStateMixin {

  double itemHeight = 80.0;
  List<Map> players = [];

  @override
  void initState() {
    super.initState();

    players.addAll(Constants.PLAYERS);
    players.addAll(Constants.PLAYERS);
    players.addAll(Constants.PLAYERS);
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScrollController scroller = new ScrollController();

  scrollList(int type) {
    switch (type) {
    case 0:
      scroller.animateTo(0, curve: Curves.easeIn, duration: Duration(milliseconds: 500));
      break;
    case 1:
      scroller.animateTo(players.length * itemHeight / 2, curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
      break;
    case 2:
      scroller.animateTo(players.length * itemHeight, curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(child: Text('至顶部'), onPressed: () {scrollList(0);}),
            RaisedButton(child: Text('至中部'), onPressed: () {scrollList(1);}),
            RaisedButton(child: Text('至底部'), onPressed: () {scrollList(2);})
          ],
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            controller: scroller,
            cacheExtent: itemHeight,
            padding: const EdgeInsets.all(8.0),
            itemCount: players.length,
            itemBuilder: (context, i) {
              final player = players[i];
              return ListTile(
                leading: Image.asset(player['headimg'], width: 50, height: 50),
                title: Text('球员' + i.toString() + ' ' + player['name']),
                subtitle: Text(player['desc']),
                trailing: IconButton(
                  icon: Icon(Icons.favorite_border, size: 30.0, color: Colors.pink),
                  onPressed: () {},
                ),
              );
            },
            separatorBuilder: (context, i) => Divider(height: 18, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}