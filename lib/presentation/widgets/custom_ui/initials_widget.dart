
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class InitialsDot extends StatelessWidget {
  final String initials;
  final bool isBig, isVerySmall, isMedium;
  final Color color;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin, padding;
  const InitialsDot({
    Key? key, required this.initials, this.isBig = false, this.isVerySmall = false, this.isMedium = false, this.color = Colors.green, this.borderColor, this.margin, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(
        top: 4,
        right: 6,
        bottom: 15
      ),
      padding:  const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor?? color,
        ),
      ),
      child: Center(
        child: Container(
          padding:padding?? EdgeInsets.all(isVerySmall ? 8: isMedium ? 27: isBig? 48 :5),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: AutoSizeText(
            initials,
            maxFontSize:isVerySmall ? 13 : isMedium ? 17:isBig ? 19:20,
            minFontSize: isVerySmall ? 10: isMedium ? 14 :isBig ?16: 11,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize:isVerySmall ? 12:isMedium ? 16: isBig ?18 : 17
            ),
          ),
        ),
      ),
    );
  }
}
