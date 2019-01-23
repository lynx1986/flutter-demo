import 'package:flutter/material.dart';
import 'package:font_social_flutter/font_social_flutter.dart';

const MENU = [
  { 'name': 'Basic', 'icon': Icons.widgets },
  { 'name': 'Layout', 'icon': Icons.view_compact },
  { 'name': 'Form', 'icon': Icons.dvr },
  { 'name': 'Painting', 'icon': Icons.color_lens },
  { 'name': 'Scrolling', 'icon': Icons.system_update },
  { 'name': 'Application', 'icon': Icons.storage},
  { 'name': 'Animation', 'icon': Icons.style },
  { 'name': 'Demos', 'icon': Icons.apps}
];

const MENU_ITEM = [
  [
    { 'name': 'Button', 'url': '/button', 'icon': Icons.radio_button_unchecked },
    { 'name': 'Text', 'url': '/text', 'icon': Icons.format_color_text },
    { 'name': 'Image', 'url': '/image', 'icon': Icons.image },
  ],
  [
    { 'name': 'Layout', 'url': '/layout', 'icon': Icons.layers},
    { 'name': 'List', 'url': '/list', 'icon': Icons.list },
    { 'name': 'Grid', 'url': '/grid', 'icon': Icons.grid_on }
  ],
  [

  ],
  [
    { 'name': 'Transform', 'url': '/transform', 'icon': Icons.transform },
    { 'name': 'Decoration', 'url': '/decoration', 'icon': Icons.border_style},
  ],
  [

  ],
  [

  ],
  [

  ],
  [
    { 'name': '知乎-我的', 'url': '/zhihu_mine', 'icon': SocialBrand.zhihu},
    { 'name': '微信-微信', 'url': '/wechat_chatlist', 'icon': SocialBrand.wechat}
  ]
];

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  // final widgetItems = const {
  //   0: { 'name': 'list', 'url': '/list', 'icon': Icons.list },
  //   1: { 'name': 'card', 'url': '/card', 'icon': Icons.subtitles },
  //   2: { 'name': 'button', 'url': '/button', 'icon': Icons.radio_button_checked },
  //   3: { 'name': 'grid', 'url': '/grid', 'icon': Icons.grid_on },
  //   4: { 'name': 'drawer', 'url': '/drawer', 'icon': Icons.drafts}
  // };
  final biggerFont = const TextStyle(fontSize: 18.0);

  int menuIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget Demo')),
      body: buideWidgetItems(context),
      drawer: buildDrawer(context),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu),
          );
        },
      ),
    );
  }

  Widget buideWidgetItems(BuildContext context) {


    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: MENU_ITEM[menuIdx].length,
      itemBuilder: (context, i) => ListTile(
        leading: new Icon(MENU_ITEM[menuIdx][i]['icon']),
        title: Text(MENU_ITEM[menuIdx][i]['name'], style: biggerFont),
        trailing: new Icon(Icons.keyboard_arrow_right),
        onTap: () => Navigator.pushNamed(context, MENU_ITEM[menuIdx][i]['url']),
      ),
      separatorBuilder: (context, i) => Divider(),
    );
  }

  Widget buildDrawer(BuildContext context) {

    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: 200,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Text(''),
              Divider(),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                itemCount: MENU.length,
                itemBuilder: (context, i) => ListTile(
                  leading: new Icon(MENU[i]['icon']),
                  title: Text(MENU[i]['name']),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      menuIdx = i;
                    });
                  },
                ),
                separatorBuilder: (context, i) => Divider(height: 4.0, color: Colors.black87,),
              ),
            ],
          )
        );
      }
    );
  }
}