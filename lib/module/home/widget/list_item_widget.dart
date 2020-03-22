import 'package:devo/values/const.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  final int currentIndex;
  final int totalCount;

  const ListItemWidget({
    Key key,
    this.currentIndex,
    this.totalCount,
  }) : super(key: key);

  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          (1 / widget.totalCount) * widget.currentIndex,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: ListTile(
        leading: CircleAvatar(),
        title: Text('Codeify'),
        subtitle: Text(
          loremIpsum,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        isThreeLine: true,
      ),
      builder: (_, child) => Transform(
        transform: Matrix4.translationValues(
          0,
          10 * (1.0 - _animation.value),
          0.0,
        ),
        child: FadeTransition(
          opacity: _animation,
          child: child,
        ),
      ),
    );
  }
}
