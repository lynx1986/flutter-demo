import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

import 'package:flutterdemo/routes/home.dart';
import 'package:flutterdemo/routes/list.dart';
import 'package:flutterdemo/routes/card.dart';
import 'package:flutterdemo/routes/button.dart';
import 'package:flutterdemo/routes/grid.dart';
import 'package:flutterdemo/routes/drawer.dart';
import 'package:flutterdemo/routes/text.dart';
import 'package:flutterdemo/routes/image.dart';
import 'package:flutterdemo/routes/layout.dart';
import 'package:flutterdemo/routes/transform.dart';
import 'package:flutterdemo/routes/decoration.dart';
import 'package:flutterdemo/routes/transition.dart';
import 'package:flutterdemo/routes/demo/zhihu_mine.dart';
import 'package:flutterdemo/routes/demo/wechat_chatlist.dart';
import 'package:flutterdemo/routes/demo/wechat_friends.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
      // initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/list': (context) => ListDemo(),
        '/card': (context) => CardDemo(),
        '/button': (context) => ButtonDemo(),
        '/text': (context) => TextDemo(),
        '/grid': (context) => GridDemo(),
        '/drawer': (context) => DrawerDemo(),
        '/image': (context) => ImageDemo(),
        '/layout': (context) => LayoutDemo(),
        '/transform': (context) => TransformDemo(),
        '/transition': (context) => TransitionDemo(),
        '/decoration': (context) => DecorationDemo(),
        '/zhihu_mine': (context) => ZhihuMineDemo(),
        '/wechat_chatlist': (context) => WechatChatListDemo(),
        '/wechat_friends': (context) => WechatFriendsDemo(),
      },
    );
  }
}