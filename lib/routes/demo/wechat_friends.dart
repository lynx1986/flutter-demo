import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:font_social_flutter/font_social_flutter.dart';

class WechatFriendsDemo extends StatefulWidget {
  const WechatFriendsDemo({ Key key }) : super(key: key);
  @override
  WechatFriendsState createState() => WechatFriendsState();
}

class WechatFriendsState extends State<WechatFriendsDemo> with SingleTickerProviderStateMixin {

  double offsetY = 200.0;
  Animation<double> animation;
  AnimationController controller;
  ScrollController listScroller;

  Animation<double> rotateAnimation;
  Animation<Offset> leaveAnimation;

  double HEADER_BG_HEIGHT = 280.0;
  double HEADER_EXPAND_HEIGHT = 200.0;
  double ICON_SIZE = 40.0;
  double REFRESH_THRESHOLD = 128.0;

  TopDockedFabLocation topFloat = new TopDockedFabLocation(dx: 16.0, dy: -80);

  @override
  void initState() {
    super.initState();

    listScroller = new ScrollController(initialScrollOffset: HEADER_EXPAND_HEIGHT);
    listScroller.addListener(() {
      if (!controller.isAnimating) {
        this.setState(() => offsetY = listScroller.offset);
      }
    });

    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this, value: 0.0);
    rotateAnimation = Tween<double>(begin: 0, end: 1.0).animate(CurveTween(curve: Interval(0.0, 0.6, curve: Curves.linear)).animate(controller));
    leaveAnimation = Tween(begin: Offset(0.0, 0.0), end: Offset(0, -5.0)).animate(CurveTween(curve: Interval(0.65, 0.95, curve: Curves.linear)).animate(controller));
    leaveAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.setState(() {
          offsetY = 200;
        });
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double translateY =  (HEADER_EXPAND_HEIGHT - offsetY);
    if (translateY > REFRESH_THRESHOLD) translateY = REFRESH_THRESHOLD;

    return Scaffold(
      appBar: AppBar(title: Text('微信-朋友圈')),
      body: buildBody(),
      floatingActionButton: SlideTransition(
        position: leaveAnimation,
        child: Transform.translate(
          offset: Offset(0, translateY),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(math.pi * ((HEADER_EXPAND_HEIGHT - offsetY) / HEADER_EXPAND_HEIGHT) / 0.5),
            child: RotationTransition(
              child: Opacity(
                opacity: 1,
                child: Icon(SocialBrand.wechat_friends, size: ICON_SIZE, color: Colors.orange),
              ),
              turns: rotateAnimation
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: topFloat,
    );
  }

  Widget buildBody() {

    List<Widget> listItems = [ buildHeader() ];

    listItems.addAll(Constants.ACTIVITIES.map((activity) {
      int curIndex = Constants.ACTIVITIES.indexOf(activity);
      bool isLast = curIndex == Constants.ACTIVITIES.length - 1;
      return buildItem(activity, curIndex, isLast );
    }).toList());
    
    return Listener(
      onPointerUp: ((p) {
        // 松开以后，开始执行旋转的动作
        this.setState(() { offsetY = 0.0; });
        if (listScroller.offset < HEADER_EXPAND_HEIGHT - REFRESH_THRESHOLD) {
          controller.forward();
        }
        if (listScroller.offset < HEADER_EXPAND_HEIGHT) {
          listScroller.animateTo(HEADER_EXPAND_HEIGHT,  duration: Duration(milliseconds: 500), curve: Curves.linear);
        }
      }),
      onPointerMove: ((p) {
        this.setState(() { offsetY = listScroller.offset; });
      }),
      child: ListView(
        controller: listScroller,
        shrinkWrap: true,
        children: listItems
      ),
    );
  }
  
  Widget buildHeader() {
    
    Map player = Constants.PLAYERS[0];

    // double offsetMax = HEADER_EXPAND_HEIGHT - offsetY;
    // if (offsetMax > 60) offsetMax = 60;

    return Container(
      height: HEADER_BG_HEIGHT + HEADER_EXPAND_HEIGHT,
      child: Column(
        children: <Widget>[
          Container(height: HEADER_EXPAND_HEIGHT),
          Container(
            padding: EdgeInsets.only(right: 16.0, bottom: 18.0),
            alignment: Alignment.bottomRight,
            height: HEADER_BG_HEIGHT,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(player['background']),
                alignment: Alignment.topCenter
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 12.0, bottom: 16.0),
                  child: Text(player['name'], style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(player['headimg'], height: 80, width: 80),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(Map item, int cur, bool last) {

    Map player = Constants.PLAYERS[cur];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(player['headimg'], width: 40, height: 40, fit: BoxFit.fill),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(player['name'], style: TextStyle(fontSize: 16.0, color: Colors.blue)),
                      ),
                      buildItemContent(item),
                      Container(height: 10.0),
                      buildItemImages(item),
                      Container(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('去年', style: TextStyle(color: Colors.grey[400])),
                          Expanded(child: Container()),
                          Comment()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            height: 1.0, color: last ? Colors.transparent : Colors.grey[200]
          )
        ],
      ),
    );
  }

  Widget buildItemContent(item) {

    if (item['type'] == 'link') {
      return Container(
        padding: EdgeInsets.all(4.0),
        color: Colors.grey[200],
        child: Row(
          children: <Widget>[
            Image.network(item['linkImage'], width: 40.0, height: 40.0),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text(item['linkTitle']),
            )
          ],
        ),
      );
    }
    else {
      return Container(
        padding: EdgeInsets.all(4.0),
        child: Text(item['text'], style: TextStyle(fontSize: 16.0)),
      );
    }
  }

  Widget buildItemImages(item) {

    if (item['images'] == null || item['images'].length == 0) return Container();

    if (item['images'].length == 1) {
      return Image.network(item['images'][0], height: 160.0,);
    }
    else {

      List urls = item['images'];

      return Container(
        padding: EdgeInsets.only(right: 16.0) ,
        child: GridView.count(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          crossAxisCount: 3,
          children: urls.map((imageUrl)  {
            return Image.network(imageUrl, fit: BoxFit.fill);
          }).toList(),
        ),
      );
    }
  }
}

class Comment extends StatefulWidget {
  const Comment({ Key key }) : super(key: key);
  @override
  CommentState createState() => CommentState();
}

class CommentState extends State<Comment> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this, value: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void toggleCommentBar() {
    controller.animateTo(controller.value > 0 ? 0.0 : 200.0, curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizeTransition(
          child: Container(
            color: Colors.black87,
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  label: Text('取消', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.favorite_border, color: Colors.white),
                  onPressed: () { toggleCommentBar(); },
                ),
                FlatButton.icon(
                  label: Text('评论', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.comment, color: Colors.white),
                  onPressed: () { toggleCommentBar(); },
                ),
              ],
            ),
          ),
          axis: Axis.horizontal,
          sizeFactor: CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        Container(width: 10),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: Text('··', style: TextStyle(fontSize: 26.0)),
          ),
          onTap: () { toggleCommentBar(); },
        ),
      ],
    );
  }
}

// class RefreshIconAnimator extends FloatingActionButtonAnimator {

//   @override
//   Animation<double> getScaleAnimation({Animation<double> parent}) {
//     // Animate the scale down from 1 to 0 in the first half of the animation
//     // then from 0 back to 1 in the second half.
//     const Curve curve = Interval(0.5, 1.0, curve: Curves.ease);
//     return _AnimationSwap<double>(
//       ReverseAnimation(parent.drive(CurveTween(curve: curve.flipped))),
//       parent.drive(CurveTween(curve: curve)),
//       parent,
//       0.5,
//     );
//   }

//   // Because we only see the last half of the rotation tween,
//   // it needs to go twice as far.
//   static final Animatable<double> _rotationTween = Tween<double>(
//     begin: 1.0 - kFloatingActionButtonTurnInterval * 2.0,
//     end: 1.0,
//   );

//   static final Animatable<double> _thresholdCenterTween = CurveTween(curve: const Threshold(0.5));

//   @override
//   Animation<double> getRotationAnimation({Animation<double> parent}) {
//     // This rotation will turn on the way in, but not on the way out.
//     return _AnimationSwap<double>(
//       parent.drive(_rotationTween),
//       ReverseAnimation(parent.drive(_thresholdCenterTween)),
//       parent,
//       0.5,
//     );
//   }

//   @override
//   Offset getOffset({Offset begin, Offset end, double progress}) {
//     double dx = begin.dx + (end.dx - begin.dx) / progress;
//     double dy = begin.dy + (end.dy - begin.dy) / progress;
//     return Offset(dx, dy);
//   }
// }

// class _AnimationSwap<T> extends CompoundAnimation<T> {
//   /// Creates an [_AnimationSwap].
//   ///
//   /// Both arguments must be non-null. Either can be an [AnimationMin] itself
//   /// to combine multiple animations.
//   _AnimationSwap(Animation<T> first, Animation<T> next, this.parent, this.swapThreshold): super(first: first, next: next);

//   final Animation<double> parent;
//   final double swapThreshold;

//   @override
//   T get value => parent.value < swapThreshold ? first.value : next.value;
// }

class TopDockedFabLocation extends FloatingActionButtonLocation {

  final double dx;
  final double dy;

  const TopDockedFabLocation({ this.dx, this.dy }) : super();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    return Offset(dx, (fabHeight + dy));
  }
}
