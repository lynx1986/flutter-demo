import 'package:flutter/material.dart';
import 'package:flutterdemo/constants.dart';
import 'package:flutterdemo/widgets/header.dart';
import 'package:flutterdemo/widgets/display.dart';
import 'package:flutterdemo/widgets/hint.dart';

const IMG_SIZE = 70.0;

class TransitionDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transition Demo')),
      body: buildBody()
    );
  }

  Widget buildBody() {

    Widget demoImage = Image.asset(Constants.PLAYERS[0]['headimg'], width: IMG_SIZE, height: IMG_SIZE);
    Widget circleImage = ClipRRect(
      child: demoImage,
      borderRadius: BorderRadius.circular(IMG_SIZE),
    );

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      children: <Widget>[
        Header(title: 'Size Transition'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(width: 1, height: IMG_SIZE),
              TransitionItem(
                child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                axis: Axis.vertical, axisAlignment: 0.0, curve: Curves.easeIn, 
              ),
              TransitionItem(
                child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                axis: Axis.vertical, axisAlignment: -1.0, curve: Curves.bounceOut
              ),
              TransitionItem(
                child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                axis: Axis.vertical, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
              ),
              TransitionItem(
                child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                axis: Axis.vertical, axisAlignment: 1.0, curve: Curves.linear
              ),
            ],
          ),
        ),
        Hint(text: 'Horizontal：在Row中横向尺寸被伸展，放到Container中动画并不生效，需要再嵌套一层Center。'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                    axis: Axis.horizontal, axisAlignment: 0.0, curve: Curves.easeIn,
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                    axis: Axis.horizontal, axisAlignment: -1.0, curve: Curves.bounceOut
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: IMG_SIZE, type: TransitionItem.TYPE_SIZE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.linear
                  ),
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Fade Transition'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_FADE,
                    axis: Axis.horizontal, axisAlignment: 0.0, curve: Curves.easeIn,
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_FADE,
                    axis: Axis.horizontal, axisAlignment: -1.0, curve: Curves.bounceOut
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_FADE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: demoImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_FADE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.linear
                  ),
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Rotation Transition'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_ROTATE,
                    axis: Axis.horizontal, axisAlignment: 0.0, curve: Curves.easeIn,
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_ROTATE,
                    axis: Axis.horizontal, axisAlignment: -1.0, curve: Curves.bounceOut
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_ROTATE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_ROTATE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.linear
                  ),
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Scale Transition'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SCALE,
                    axis: Axis.horizontal, axisAlignment: 0.0, curve: Curves.easeIn,
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SCALE,
                    axis: Axis.horizontal, axisAlignment: -1.0, curve: Curves.bounceOut
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SCALE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SCALE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.linear
                  ),
                ),
              ),
            ],
          ),
        ),
        Header(title: 'Slide Transition'),
        Hint(text: 'SlideTransition使用的是Animation<Offset>'),
        Display(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SLIDE,
                    axis: Axis.horizontal, axisAlignment: 0.0, curve: Curves.easeIn,
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SLIDE,
                    axis: Axis.horizontal, axisAlignment: -1.0, curve: Curves.bounceOut
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SLIDE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.fastOutSlowIn
                  ),
                ),
              ),
              Container(
                width: IMG_SIZE,
                child: Center(
                  child: TransitionItem(
                    child: circleImage, begin: 0, end: 1.0, type: TransitionItem.TYPE_SLIDE,
                    axis: Axis.horizontal, axisAlignment: 1.0, curve: Curves.linear
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TransitionItem extends StatefulWidget {

  static const int TYPE_SIZE = 0;
  static const int TYPE_FADE = 1;
  static const int TYPE_ROTATE = 2;
  static const int TYPE_SCALE = 3;
  static const int TYPE_SLIDE = 4;

  final Widget child;
  final Animation<double> animation;
  final Axis axis;
  final double axisAlignment;
  final Curve curve;
  final double begin;
  final double end;
  final int type;

  const TransitionItem({ 
    Key key,
    this.child,
    this.animation,
    this.axis,
    this.axisAlignment,
    this.curve,
    this.begin,
    this.end,
    this.type,
  }) : super(key: key);

  @override
  TransitionState createState() => TransitionState();
}

class TransitionState extends State<TransitionItem> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  Animation<Offset> offsetAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

    if (widget.type == TransitionItem.TYPE_SLIDE) {
      offsetAnimation = Tween<Offset>(begin: Offset(widget.begin, 0), end: Offset(widget.end, 0)).animate(CurveTween(curve: widget.curve).animate(controller));
    }
    else {
      animation = Tween(begin: widget.begin, end: widget.end).animate(controller);
    }
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    switch(widget.type) {

    case TransitionItem.TYPE_SIZE:
      return buildSizeTransition(); break;
    case TransitionItem.TYPE_FADE:
      return buildFadeTransition(); break;
    case TransitionItem.TYPE_ROTATE:
      return buildRotateTransition(); break;
    case TransitionItem.TYPE_SCALE:
      return buildScaleTransition(); break;
    case TransitionItem.TYPE_SLIDE:
      return buildSlideTransition(); break;
    default:
      return Container();
    }
  }

  Widget buildSlideTransition() {
    return SlideTransition(
      child: widget.child,
      position: offsetAnimation,
    );
  }

  Widget buildScaleTransition() {
    return ScaleTransition(
      child: widget.child,
      scale: CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
  }

  Widget buildRotateTransition() {
    return RotationTransition(
      child: widget.child,
      turns: CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
  }

  Widget buildFadeTransition() {
    return FadeTransition(
      child: widget.child,
      opacity: CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
  }

  Widget buildSizeTransition() {
    return SizeTransition(
      child: widget.child,
      axisAlignment: widget.axisAlignment,
      axis: widget.axis,
      sizeFactor: CurvedAnimation(
        parent: controller,
        curve: widget.curve,
      ),
    );
  }
}