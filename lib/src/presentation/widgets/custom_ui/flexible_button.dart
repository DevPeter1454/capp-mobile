
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/src/theme/app_colors.dart';


class FlexibleButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  final bool enabled, hasBorder;
  final double width ;
  const FlexibleButton({
    Key? key,
    required this.text,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    this.press, this.enabled = true, required this.width, this.hasBorder = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        border: hasBorder ? Border.all(
          color: AppColors.primary,
          width: 0.5
        ) : null
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          onPressed:enabled ? press :(){

          },
          style: TextButton.styleFrom(
            backgroundColor: enabled ? color : color.withOpacity(.3),
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20)
          ),
          child:AutoSizeText(
            text,
            maxLines: 2,
            minFontSize: 12,
            maxFontSize: 14,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
