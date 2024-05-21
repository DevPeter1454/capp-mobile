import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';



class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({
    Key? key, required this.onTap, this.color, this.rightWidget, this.centerWidget,
  }) : super(key: key);
  final Function onTap;
  final Color? color;
  final Widget? rightWidget, centerWidget;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SizedBox(
                width: 30,
                child: Image.asset(
                  'assets/images/arrowback.png', color: color ?? (themeProvider.isDarkMode ? Colors.white : Colors.black),),
              ),
            ),
          ),
          Spacer(),
          centerWidget ?? SizedBox(),
          Spacer(),
          rightWidget ?? SizedBox()
        ],
      );
    });
  }
}
