
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class HeaderWidgetBtn extends StatelessWidget {
  const HeaderWidgetBtn({
    Key? key,
    this.press,
    this.isEnabled = false,
    required this.title, this.width = 150,
  }) : super(key: key);
  final Function()? press;
  final bool isEnabled;
  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? press : () {},
      child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
              color: isEnabled
                  ? Colors.greenAccent.withAlpha(2000).withOpacity(.2)
                  : Colors.greenAccent.withAlpha(2000).withOpacity(.1),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: AutoSizeText(
              title,
              maxLines: 1,
              maxFontSize: 14,
              minFontSize: 10,
              style: TextStyle(
                  color: isEnabled ? Colors.white : Colors.white54,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
