import 'package:flutter/material.dart';

class LogoWithTextWidget extends StatelessWidget {
  const LogoWithTextWidget({
    super.key,  this.logoWidth,  this.fontSize,
  });
  final double? logoWidth, fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width:logoWidth ?? 60,
            child: Image.asset('assets/images/logo.png',
              fit: BoxFit.fill,)),
        Text('Capp', style: TextStyle(fontWeight: FontWeight.w700,
            fontSize: fontSize?? 52),)

      ],
    );
  }
}