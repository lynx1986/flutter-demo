import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';
import 'package:flutterdemo/widgets/hint.dart';

const IMG_SIZE = 70.0;

class AnimatedDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Demo')),
      body: buildBody(context)
    );
  }

  Widget buildBody(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'Animated Size'),
        Display(
          child: Row(
            children: <Widget>[
              AnimatedItem(type: AnimatedItem.TYPE_SIZE, start: 60, end: 80, startTitle: '放大', endTitle: '缩小'),
            ],
          ),
        ),
        Header(title: 'Animated Opacity'),
        Display(
          child: Row(
            children: <Widget>[
              AnimatedItem(type: AnimatedItem.TYPE_FADE, start: 1.0, end: 0.0, startTitle: '透明', endTitle: '显示'),
            ],
          ),
        ),
        Header(title: 'Animated Align'),
        Display(
          child: Row(
            children: <Widget>[
              Expanded(
                child: AnimatedItem(type: AnimatedItem.TYPE_ALIGN, start: 0, end: 1, startTitle: '靠右', endTitle: '靠左'),
              ),
            ],
          ),
        ),
        Header(title: 'Animated Listener'),
        Hint(text: '监听动画'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 240.0,
                child: AnimatedWidgetDemo(),
              )
            ],
          ),
        ),
        Header(title: '简单Demo'),
        Display(
          child: AnimationDemo(),
        ),
        Header(title: '并行动画'),
        Hint(text: '多种动画同时发生'),
        Display(
          child: Container(
            height: 200.0,
            child: ParallelAnimatedDemo(),
          )
        ),
        Header(title: '串行动画'),
        Hint(text: '多个动画连续发生，处理的原理就是将各个动画设置一个delay。'),
        Display(
          child: Container(
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.width,
            child: SequencialAnimatedDemo()
          ),
        )
      ],
    );
  }
}

class AnimatedItem extends StatefulWidget {

  static const int TYPE_SIZE = 0;
  static const int TYPE_FADE = 1;
  static const int TYPE_ALIGN = 2;

  final int type;
  final double start;
  final double end;
  final String startTitle;
  final String endTitle;

  const AnimatedItem({
    Key key,
    this.type,
    this.start,
    this.end,
    this.startTitle,
    this.endTitle
  }) : super(key: key);

  @override
  AnimatedState createState() => AnimatedState();
}

class AnimatedState extends State<AnimatedItem> with SingleTickerProviderStateMixin {

  double value;

  @override
  void initState() {
    super.initState();
    value = widget.start;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget animatedItem = Container();

    switch(widget.type) {

    case AnimatedItem.TYPE_SIZE:
      animatedItem = buildAnimatedSize(); break;
    case AnimatedItem.TYPE_FADE:
      animatedItem = buildAnimatedOpacity(); break;
    case AnimatedItem.TYPE_ALIGN:
      animatedItem = buildAnimatedAlign(); break;
    }

    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(value == widget.start ? widget.startTitle : widget.endTitle),
          onPressed: () {
            this.setState(() { value = value == widget.start ? widget.end : widget.start; });
          },
        ),
        animatedItem
      ],
    );
  }

  Widget buildAnimatedAlign() {
    return AnimatedAlign(
      child: Container(color: Colors.blue, width: 60, height: 60),
      alignment: value == 0 ? Alignment.centerLeft : Alignment.centerRight,
      duration: Duration(milliseconds: 800),
    );
  }

  Widget buildAnimatedOpacity() {
    return AnimatedOpacity(
      child: Container(color: Colors.blue, width: 60, height: 60),
      opacity: value,
      duration: Duration(milliseconds: 1000),
    );
  }

  Widget buildAnimatedSize() {
    return  AnimatedSize(
      vsync: this,
      child: Container(
        color: Colors.blue, width: value, height: value
      ),
      duration: Duration(milliseconds: 600),
    );
  }
}

const double LOGO_MAX = 120.0;
const double LOGO_MIN = 60.0;

class ParallelAnimatedDemo extends StatefulWidget {
  ParallelAnimatedState createState() => ParallelAnimatedState();
}

class ParallelAnimatedState extends State<ParallelAnimatedDemo> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;
  bool completed = false;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation.addStatusListener((state) {
      this.setState(() => completed = state == AnimationStatus.completed);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text(completed ? '回放' : '正放'),
          onPressed: () {
            completed ? controller.reverse() : controller.forward();
          },
        ),
        AnimatedParallelLogo(animation: animation)
      ],
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  AnimatedWidgetDemoState createState() => AnimatedWidgetDemoState();
}


class AnimatedWidgetDemoState extends State<AnimatedWidgetDemo> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation;
  bool completed = false;
  String status = '';

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: LOGO_MIN, end: LOGO_MAX).animate(controller);
    animation.addStatusListener((state) {
      this.setState(() {
        completed = state == AnimationStatus.completed;
        print(state);
        status = state.toString();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text('动画状态：' + status),
        RaisedButton(
          child: Text(completed ? '缩小' : '放大'),
          onPressed: () {
            completed ? controller.reverse() : controller.forward();
          },
        ),
        AnimatedLogo(animation: animation)
      ],
    );
  }
}

class AnimatedLogo extends AnimatedWidget {

  AnimatedLogo({
    Key key,
    Animation<double> animation
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class AnimatedParallelLogo extends AnimatedWidget {

  final opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  final sizeTween = new Tween<double>(begin: 60.0, end: 120.0); 

  AnimatedParallelLogo({
    Key key,
    Animation<double> animation
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Opacity(
      opacity: opacityTween.evaluate(animation),
      child: new Container(
        height: sizeTween.evaluate(animation),
        width: sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),
    );
  }
}

class SequencialAnimatedDemo extends StatefulWidget {
  SequencialAnimatedState createState() => SequencialAnimatedState();
}

class SequencialAnimatedState extends State<SequencialAnimatedDemo> with SingleTickerProviderStateMixin {

  AnimationController transformController;
  Animation<Offset> animation1;
  Animation<Offset> animation2;
  Animation<Offset> animation3;
  Animation<Offset> animation4;

  AnimationController ballController;
  Animation<double> ballAnimation;

  int curSlide = 0;
  List<Tween<Offset>> slideTweens = [
    Tween(begin: Offset(0.0, 0.0), end: Offset(0.8, 0.8)),
    Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.8)),
    Tween(begin: Offset(0.0, 0.0), end: Offset(-0.8, 0.8)),
    Tween(begin: Offset(0.0, 0.0), end: Offset(0.0, -0.8)),
  ];
  Tween<Offset> slideTween = Tween(begin: Offset(0.0, 0.0), end: Offset(0.8, 0.8));

  @override
  void initState() {
    super.initState();

    ballController = AnimationController(duration: Duration(milliseconds: 4000), vsync: this);
    ballAnimation = CurvedAnimation(curve: Curves.easeIn, parent: ballController);
    
    animation1 = slideTweens[0].animate(CurveTween(curve: Interval(0.0, 0.25, curve: Curves.fastOutSlowIn)).animate(ballController));
    animation2 = slideTweens[1].animate(CurveTween(curve: Interval(0.25, 0.50, curve: Curves.bounceIn)).animate(ballController));
    animation3 = slideTweens[2].animate(CurveTween(curve: Interval(0.50, 0.75, curve: Curves.decelerate)).animate(ballController));
    animation4 = slideTweens[3].animate(CurveTween(curve: Interval(0.75, 1.0, curve: Curves.linear)).animate(ballController));

    // ballController.repeat();

    animation4.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ballController.reverse();
      }
    });
    animation1.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        ballController.forward();
      }
    });

    ballController.forward();
    // startAnimation();
  }

  Future<Null> startAnimation() async {
    try {
      await ballController.forward().orCancel;
      await ballController.reverse().orCancel;
    } on TickerCanceled {
    }
  }

  @override
  void dispose() {
    ballController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: buildAnimatedDemo,
      animation: ballController,
    );
  }

  Widget buildAnimatedDemo(BuildContext context, Widget child) {
    return SlideTransition(
      position: animation4,
      child: SlideTransition(
        position: animation3,
        child: SlideTransition(
          position: animation2,
          child: SlideTransition(
            position: animation1,
            child: Container(
              alignment: Alignment.topLeft,
              child: PlayerBall(animation: ballAnimation),
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerBall extends AnimatedWidget {

  PlayerBall({
    Key key,
    Animation<double> animation
  }) : super(key: key, listenable: animation);

  final Tween<double> opacityTween = Tween(begin: 0.1, end: 1.0);
  final Tween<double> rotationTween = Tween(begin: 0, end: math.pi / 2);

  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return RotationTransition(
      turns: rotationTween.animate(animation),
      child: Opacity(
        opacity: opacityTween.evaluate(animation),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.asset(Constants.PLAYERS[6]['headimg'], width: 80.0, height: 80.0, fit: BoxFit.fill)
        ),
      ),
    );
  }
}

class AnimationDemo extends StatefulWidget {
    AnimationDemoState createState() => AnimationDemoState();
}

class AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin {
    
    AnimationController controller;
    Tween<double> slideTween = Tween(begin: 0.0, end: 20.0);
    Animation<double> animation;
    
    @override
    void initState() {
        super.initState();
        
        controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
        animation = slideTween.animate(CurvedAnimation(parent: controller, curve: Curves.linear));
        animation.addListener(() => this.setState(() {}));

        controller.repeat();
    }

    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }
    
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 200,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: animation.value),
        child: Container(
          color: Colors.blue,
          width: 80,
          height: 80,
        ),
      );
    }
}