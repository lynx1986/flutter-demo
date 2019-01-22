import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';

BoxDecoration containerDecoration = new BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(color: Colors.grey[500], offset: Offset(0.0, 1.0), blurRadius: 1.0)
  ]
);

class ZhihuMineDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('知乎-我的')),
      body: buildBody(),
    );
  }

  Widget buildBody() {

    return Container(
      color: Colors.black12,
      child: ListView(
        children: <Widget>[
          buildHeader(),
          buildStats(),
          Divider(color: Colors.transparent, height: 8),
          buildContentTablets(),
          Divider(color: Colors.transparent, height: 8),
          buildSettingTablets(),
          Divider(color: Colors.transparent, height: 8),
          buildQuestion(),
          Divider(color: Colors.transparent, height: 8),
          buildWorks(),
          Divider(color: Colors.transparent, height: 8),
          buildThoughts(),
          Divider(color: Colors.transparent, height: 20),
          Center(
            child: RaisedButton.icon(
              color: Colors.white,
              shape: StadiumBorder(),
              label: Text('添加卡片'),
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
          Divider(height: 30, color: Colors.transparent),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(Constants.PLAYERS[0]['background'], 
            fit: BoxFit.cover, color: Colors.blue, colorBlendMode: BlendMode.darken,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    child: Image.asset(Constants.PLAYERS[0]['headimg'], width: 60, height: 60,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(Constants.PLAYERS[0]['name'], style: TextStyle(color: Colors.white, fontSize: 18.0)),
                      Container(
                        margin: EdgeInsets.only(top: 6.0),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0), right: Radius.circular(20.0)),
                          color: Colors.black54
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(2.0),
                              margin: EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.delete, color: Colors.white, size: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.blue
                              ),
                            ),
                            Text('知乎盐值： 553', style: TextStyle(fontSize: 12.0, color: Colors.white54)),
                            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 14.0,),
                          ],
                        ),
                      )
                    ],
                  )
                ),
                Expanded(child: Text(''),),
                Text('个人主页', style: TextStyle(color: Colors.white)),
                Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 18.0),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildStats() {

    Widget verticalDivider = Container(
      height: 18,  width: 0,
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black26))),
    );

    const List<Map> stats = [
      { "title": "我的创作", "count": "53" },
      { "title": "关注", "count": "93" },
      { "title": "我的收藏", "count": "22" },
      { "title": "最近浏览", "count": "198" }
    ];

    List<Widget> widgets = [];
    stats.forEach((stat) {
      widgets.add(
        Column(
          children: <Widget>[
            Text(stat['count'], style: TextStyle(fontSize: 18.0)),
            Text(stat['title']),
          ],
        )
      );

      if (stats.indexOf(stat) != stats.length - 1) {
        widgets.add(verticalDivider);
      }
    });

    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 16),
      decoration: containerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: widgets,
      ),
    );
  }

  Widget buildContentTablets() {

    List<Map> tablets1 = [
      { 'name': '学习记录', 'icon': Icons.headset, 'notified': false, 'color': Colors.blue },
      { 'name': '已购', 'icon': Icons.shopping_basket, 'notified': true, 'color': Colors.cyan },
      { 'name': '余额礼券', 'icon': Icons.card_giftcard, 'notified': true, 'color': Colors.blueAccent },
      { 'name': '我的Live', 'icon': Icons.live_tv, 'notified': false, 'color': Colors.lightBlue},
    ];

    List<Map> tablets2 = [
      { 'name': '我的书架', 'icon': Icons.book, 'notified': false, 'color': Colors.purple },
      { 'name': '下载中心', 'icon': Icons.cloud_download, 'notified': false, 'color': Colors.orange },
      { 'name': '付费咨询', 'icon': Icons.monetization_on, 'notified': true, 'color': Colors.pink },
      { 'name': '活动广场', 'icon': Icons.speaker, 'notified': false, 'color': Colors.teal },
    ];

    return Container(
      decoration: containerDecoration,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(0, 12, 0, 16),
            child: Row(
              children: buildTabletItems(tablets1)
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: buildTabletItems(tablets2)
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingTablets() {

    List<Map> tablets = [
      { 'name': '社区建设', 'icon': Icons.build, 'notified': false, 'color': Colors.deepOrange },
      { 'name': '反馈帮助', 'icon': Icons.flag, 'notified': false, 'color': Colors.grey },
      { 'name': '夜间模式', 'icon': Icons.event_busy, 'notified': false, 'color': Colors.purple },
      { 'name': '设置', 'icon': Icons.settings, 'notified': false, 'color': Colors.grey },
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: containerDecoration,
      child: Row(
        children: buildTabletItems(tablets)
      ),
    );
  }

  List<Widget> buildTabletItems(List<Map> tablets) {

    Container dotted = new Container(
      width: 10, height: 10, margin: EdgeInsets.only(left: 6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
    );

    return tablets.map((Map tablet) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCircleIcon(tablet['icon'], tablet['color']),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: Container()),
                Text(tablet['name']),
                Expanded(flex: 1, child: Container(
                  alignment: Alignment.centerLeft,
                  child: tablet['notified'] ? dotted : Container()
                ))
              ],
            )
          ],
        ),
      );
    }).toList();
  }

  Widget buildQuestion() {

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: containerDecoration,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                buildCircleIcon(Icons.note, Colors.blue),
                Padding(
                  child: Text('回答问题', style: TextStyle(fontSize: 18.0)),
                  padding: EdgeInsets.only(left: 12),
                ),
                Expanded(child: Text('')),
                Text('更多问题', style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: <Widget>[
                Text('今年贩卖焦虑鼓励留存资金的和之前鼓励超生的是同一拨人吗？',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,  softWrap: false, maxLines: 1,
                ),
                Divider(color: Colors.transparent, height: 6),
                Text('今年市场大环境不好，很多都说空客时间，保留现金巴拉巴拉。',
                  overflow: TextOverflow.ellipsis,  softWrap: false, maxLines: 1,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: <Widget>[
                Text('2人关注', style: TextStyle(color: Colors.grey)),
                Expanded(child: Text('')),
                FlatButton.icon(
                  label: Text('忽略', style: TextStyle(color: Colors.grey)),
                  icon: Icon(Icons.visibility_off, size: 18, color: Colors.grey),
                  onPressed: () {},
                ),
                FlatButton.icon(
                  label: Text('回答', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  icon: Icon(Icons.edit, size: 18, color: Colors.blue,),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildWorks() {

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: containerDecoration,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                buildCircleIcon(Icons.camera, Colors.orange),
                Padding(
                  child: Text('视频创作', style: TextStyle(fontSize: 18.0)),
                  padding: EdgeInsets.only(left: 12),
                ),
                Expanded(child: Text('')),
                Text('拍一个', style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.PLAYERS.length,
              separatorBuilder: (context, i) => Text(''),
              itemBuilder: (context, i) {
                final player = Constants.PLAYERS[i];
                return Container(
                  margin: EdgeInsets.all(6.0),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(player['background']),
                      Positioned(
                        left: 16, top: 8,
                        child: Text(player['name'], 
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ),
                      Positioned(
                        left: 16, bottom: 8,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.orange, 
                          child: Text('创作', style: TextStyle(color: Colors.white)),
                        )
                      ),
                    ],
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThoughts() {

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: containerDecoration,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                buildCircleIcon(Icons.lightbulb_outline, Colors.orange),
                Padding(
                  child: Text('想法', style: TextStyle(fontSize: 18.0)),
                  padding: EdgeInsets.only(left: 12),
                ),
                Expanded(child: Text('')),
                Text('去往想法首页', style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.PLAYERS.length,
              separatorBuilder: (context, i) => Text(''),
              itemBuilder: (context, i) {
                final player = Constants.PLAYERS[i];
                return Container(
                  width: 240,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(player['name'], 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                          ),
                          Divider(height: 4,),
                          Text(player['desc'], style: TextStyle(fontSize: 16))
                        ],
                      ),
                      Expanded(child: Text('')),
                      Image.asset(player['headimg'])
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

  Widget buildCircleIcon(IconData icon, Color color) {

    return Container(
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.only(bottom: 4.0),
      child: Icon(icon, color: Colors.white, size: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color
      ),
    );
  }

}