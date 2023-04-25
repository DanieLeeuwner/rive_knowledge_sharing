import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RiveAnimation.asset(
      'assets/animation.riv',
      artboard: 'Box',
      fit: BoxFit.contain,
    );
  }
}
