import 'package:flutter/material.dart';

class LogoWithTextWidget extends StatelessWidget {
  const LogoWithTextWidget(
      {super.key,
      this.logoWidth,
      this.fontSize,
      this.titleColor = Colors.black,
      this.isHorizontal = true});
  final double? logoWidth, fontSize;
  final Color titleColor;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: logoWidth ?? 60,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  )),
              Text(
                'CAPP',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                    fontSize: fontSize ?? 52),
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: logoWidth ?? 60,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                  )),
              Text(
                'CAPP',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                    fontSize: fontSize ?? 52),
              )
            ],
          );
  }
}
