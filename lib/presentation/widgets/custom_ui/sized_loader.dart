
import 'package:flutter/material.dart';


class SizedLoaderWidget extends StatelessWidget {
  const SizedLoaderWidget({
    Key? key, this.height =  15, this.width = 15, this.color,
  }) : super(key: key);
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding:  const EdgeInsets.all(3),
        child: Center(child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor:
           AlwaysStoppedAnimation<Color>(color??Theme.of(context).primaryColor),
        )),
      ),
    );
  }
}
