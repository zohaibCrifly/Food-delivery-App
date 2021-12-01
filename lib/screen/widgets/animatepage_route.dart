import 'package:flutter/material.dart';

class AnimateRoute extends MaterialPageRoute {
  final Widget page;
  AnimateRoute({
    required this.page,
  }) : super(builder: (BuildContext context) => page);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1, 0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end);
    final offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
