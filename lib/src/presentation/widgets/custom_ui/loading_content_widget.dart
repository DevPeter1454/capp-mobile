

import 'package:flutter/material.dart';


class LoadingContentWidget extends StatelessWidget {
  const LoadingContentWidget({
    Key? key, this.height,
  }) : super(key: key);
  final double? height;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * .4,
      width: size.width,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor:  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
