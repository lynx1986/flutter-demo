import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';

const List<Map> GRID_DATA = [
  { 'color': Colors.blue, 'title': 'item1' },
  { 'color': Colors.green, 'title': 'item2' },
  { 'color': Colors.cyan, 'title': 'item3' },
  { 'color': Colors.orange, 'title': 'item4' },
  { 'color': Colors.indigo, 'title': 'item5' },
  { 'color': Colors.brown, 'title': 'item6' },
  { 'color': Colors.purple, 'title': 'item7' },
  { 'color': Colors.pink, 'title': 'item8' },
  { 'color': Colors.red, 'title': 'item9' },
];

const List<Map> PLAYERS = Constants.PLAYERS;

class GridDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Demo'),
      ),
      body: buildDemos(context)
    );
  }

  Widget buildDemos(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: '简单Grid'),
        Display(
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 3,
            children: GRID_DATA.map((Map data) {
              return Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: data['color']),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Text(data['title']),
              );
            }).toList(),
          ),
        ),
        Header(title: '简单Grid-居中'),
        Display(
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 4,
            children: GRID_DATA.map((Map data)  {
              return Container(
                color: data['color'], alignment: Alignment.center, 
                child: Text(data['title'], style: TextStyle(fontSize: 18.0)),
              );
            }).toList(),
          ),
        ),
        Header(title: '简单Grid-图片'),
        Display(
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 3,
            children: PLAYERS.map((Map player)  {
              return Container(
                child: Image.asset(player['headimg'], fit: BoxFit.fill),
              );
            }).toList(),
          ),
        ),
        Header(title: '图标文字'),
        Display(
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 3,
            children: PLAYERS.map((Map player)  {
              return Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.headset),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(player['name']),
                    )
                  ],
                )
              );
            }).toList(),
          ),
        ),
        Header(title: '背景图片-图标文字'),
        Display(
          child: GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            crossAxisCount: 2,
            children: PLAYERS.map((Map player)  {
              return 
                Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(player['headimg'], fit: BoxFit.fill),
                    Positioned(
                      bottom: 0, right: 0, left: 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        color: Colors.black54,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.headset, color: Colors.white),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(player['name'], style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite_border, color: Colors.orange),
                              onPressed: () {print('test');},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
            }).toList(),
          ),
        ),
      ],
    );
  }
}