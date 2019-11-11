import 'package:flutter/material.dart';

import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;

  StaggerAnimation({@required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        fadeAnimation = ColorTween(
          begin: Color.fromRGBO(247, 64, 106, 1.0),
          end: Color.fromRGBO(247, 64, 106, 0.0),
        ).animate(
            CurvedAnimation(parent: controller, curve: Curves.decelerate));

  final Animation<double> containerGrow;
  final Animation<Color> fadeAnimation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(children: <Widget>[
      ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          HomeTop(
            containerGrow: containerGrow,
          )
        ],
      ),
      IgnorePointer(
        child: FadeContainer(
          fadeAnimation: fadeAnimation,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
