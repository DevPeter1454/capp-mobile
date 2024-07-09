import 'package:flutter/material.dart';
class BalContainerWidget extends StatelessWidget {
  const BalContainerWidget({
    Key? key,
    this.boxGradient,
    required this.child, this.patternColor,
  }) : super(key: key);

  final Gradient? boxGradient;
  final Widget child;
  final Color? patternColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 210,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient:boxGradient ??  LinearGradient(
              colors: [
                Theme.of(context).shadowColor,
                Theme.of(context).shadowColor.withOpacity(.95),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
      child: Stack(
        children: [
          Positioned(
              top: -30,
              right: -5,
              child: Image.asset(
                "assets/images/bgwallet2.png",
                width: 120,
                height: 120,
                color: (patternColor ?? Color(0xFF9FD483)).withAlpha(65),
              )),
          Positioned(
              right: -10,
              bottom: -15,
              child: Image.asset(
                "assets/images/bgwallet4.png",
                width: 100,
                height: 100,
                color: (patternColor ?? Color(0xFF9FD483)).withAlpha(65),

              )),
          Positioned(
              right: -15,
              bottom: -20,
              child: Image.asset(
                "assets/images/bgwallet4.png",
                width: 70,
                height: 70,
                color:  (patternColor ??  Theme.of(context).highlightColor).withAlpha(45),

              )),
          Positioned(
              left: -5,
              bottom: -25,
              child: Image.asset(
                "assets/images/bgwallet.png",
                width: 100,
                height: 100,
                color: (patternColor ?? const Color(0xFF9FD483)).withAlpha(65),

              )),
          Container(
            height: 210,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
            ),
            padding: EdgeInsets.only(top: 25),
            child: child,
          ),
        ],
      ),
    );
  }
}