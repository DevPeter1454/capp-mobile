import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  const Countdown({Key? key, required this.animation, required this.style})
      : super(key: key, listenable: animation);

  final Animation<int> animation;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final Duration clockTimer = Duration(seconds: animation.value);
    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    timerText = timerText == '0:00' ? 'Expired' : timerText;

    return Text(
      timerText,
      style: style,
    );
  }
}