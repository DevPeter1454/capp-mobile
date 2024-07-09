
import 'package:flutter/material.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class BasicBmContainer extends StatelessWidget {

  final Widget childContent;
  final double? containerHeight, width;
  final EdgeInsets? padding;
  final BoxShadow? boxShadow;

  const BasicBmContainer({
    required this.childContent,
    this.containerHeight, this.padding, this.width, this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(
        builder: (context, theme,  child)
        {
          return Container(
            height: containerHeight,
            // margin: EdgeInsets.only(bottom: 20),
            width: width ??size.width ,
            padding: padding,
            decoration: BoxDecoration(
              boxShadow: !theme.isDarkMode ? [
              boxShadow??  BoxShadow(
                    color: Colors.grey.withOpacity(.15),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(2, 1))
              ]: null,
              color: Theme
                  .of(context)
                  .indicatorColor,
              borderRadius: new BorderRadius.all(const Radius.circular(10)),
            ),
            child: childContent,
          );
        });
  }
}
