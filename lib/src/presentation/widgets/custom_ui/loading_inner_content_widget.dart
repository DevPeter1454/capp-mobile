import 'package:flutter/material.dart';

class LoadingInnerContentWidget extends StatelessWidget {
  const LoadingInnerContentWidget({
    Key? key,
    this.height,
    this.color,
  }) : super(key: key);
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: height ?? size.height * .5,
      child: Center(
          child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? Theme.of(context).highlightColor))),
    );
  }
}
