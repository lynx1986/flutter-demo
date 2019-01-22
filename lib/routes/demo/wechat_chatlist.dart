import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:vibrate/vibrate.dart';

const TitleStyle = TextStyle(fontSize: 18.0, color: Colors.black);
const subTitleStyle = TextStyle(color: Colors.black45);

const chats = Constants.PLAYERS;

class WechatChatListDemo extends StatefulWidget {
  const WechatChatListDemo({ Key key }) : super(key: key);
  @override
  WechatChatListState createState() => WechatChatListState();
}

const double MAX_EXPAND_HEIGHT = 260;
const double EXPAND_THRESHOLD = 130;

class WechatChatListState extends State<WechatChatListDemo> with SingleTickerProviderStateMixin {

  ScrollController listScroller;
  double startScrollY;
  bool vibrated;
  bool canVibrate = false;

  @override
  void initState() {
    super.initState();
    listScroller = new ScrollController(initialScrollOffset: MAX_EXPAND_HEIGHT);
    init();
  }

  init() async {
    this.canVibrate = await Vibrate.canVibrate;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('微信-微信')),
      body: buildBody(),
    );
  }

  Widget buildBody() {

    return Listener(
      onPointerDown: ((p) {
        startScrollY = listScroller.offset;
        vibrated = false;
      }),
      onPointerUp: ((p) {
        if (listScroller.offset < EXPAND_THRESHOLD) {
          listScroller.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        }
        else if(listScroller.offset < MAX_EXPAND_HEIGHT) {
          listScroller.animateTo(MAX_EXPAND_HEIGHT, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        }
      }),
      onPointerMove: ((p) {
        if (startScrollY > EXPAND_THRESHOLD && listScroller.offset < EXPAND_THRESHOLD && !vibrated) {
          print('startScrollY=' + startScrollY.toString() + ' offset=' + listScroller.offset.toString());
          if (canVibrate) {
            Vibrate.vibrate();
          }
          vibrated = true;
        }
      }),
      child: ListView(
        controller: listScroller,
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            height: MAX_EXPAND_HEIGHT,
            // padding: EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                WxAppBar(
                  appData: Constants.PLAYERS,
                  title: '最近使用',
                  scrollWidth: MediaQuery.of(context).size.width/4,
                  height: (MAX_EXPAND_HEIGHT)/2,
                ),
                WxAppBar(
                  appData: Constants.PLAYERS.sublist(4),
                  title: '我的小程序',
                  scrollWidth: MediaQuery.of(context).size.width/4,
                  height: (MAX_EXPAND_HEIGHT)/2,
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: Container(
              height: 50, width: 50, alignment: Alignment.center,
              child: Icon(Icons.computer, size: 30),
            ),
            title: Text('Mac微信已登录', style: subTitleStyle)
          ),
          ListView.separated(
            physics: new ScrollPhysics(),
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (context, i) {
              final chat = chats[i];
              return Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(chat['headimg'], width: 60, height: 60, fit: BoxFit.fill),
                      )
                    ),
                    Expanded(
                      child: Container(
                        height: 92,
                        padding: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black12)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(chats[i]['name'], style: TitleStyle),
                                Container(height: 6),
                                Text(chats[i]['desc'], style: subTitleStyle)
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              padding: EdgeInsets.only(bottom: 20.0),
                              alignment: Alignment.center,
                              child: Text('1986-01-08', style: subTitleStyle),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, i) => Container(),
          )
        ],
      )
    );
  }
}


class WxAppBar extends StatelessWidget {
  
  const WxAppBar({
    Key key,
    this.title,
    this.appData,
    this.scrollWidth,
    this.height,
  }) : assert(appData != null),
    super(key: key);

  final List<Map> appData;
  final String title;
  final double scrollWidth;
  final double height;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 20.0, top: 18.0),
            child: Row(
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                Icon(Icons.keyboard_arrow_right, size: 14.0, color: Colors.grey)
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: appData.length,
              separatorBuilder: (context, i) => Text(''),
              itemBuilder: (context, i) {
                final data = appData[i];
                return Container(
                  height: height - 40,
                  width: scrollWidth,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(data['headimg'], width: 50, height: 50, fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Text(data['name'], overflow: TextOverflow.ellipsis)
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}