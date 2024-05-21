
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';


class FlexibleOutlineButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  final bool enabled;
  final double width ;
  const FlexibleOutlineButton({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.textColor = AppColors.primary,
    this.press, this.enabled = false, required this.width
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: OutlinedButton(
        onPressed:enabled ? press :(){

        },

        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29.0),
          ),
          side: BorderSide(width: 1, color: enabled ? textColor : const Color(0xFFD6D8E7),
          ),

        ),
        child: AutoSizeText(
          text,
          maxLines: 1,
          minFontSize: 8,
          maxFontSize: 14,
          style: TextStyle(color: enabled ? textColor : textColor.withOpacity(.5)),
        ),
      ),
    );
  }
}
