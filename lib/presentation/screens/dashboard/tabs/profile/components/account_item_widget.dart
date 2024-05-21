import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class AccountItemWidget extends StatelessWidget {
  final String cardText;
  final Function cardPressed;
  final Color color;
  final Widget iconWidget;
  final IconData arrowForwardType;

  const AccountItemWidget(
      this.cardText,
      this.cardPressed,
      this.color,
      this.iconWidget,
      {super.key, this.arrowForwardType = Icons.keyboard_arrow_right});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          boxShadow: !theme.isDarkMode
              ? [
            BoxShadow(
                color: Colors.grey.withOpacity(.15),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(2, 1))
          ]
              : null,
          color: Theme.of(context).indicatorColor,
          borderRadius: new BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(.2)
                ),
                padding: EdgeInsets.all(10),
                child: iconWidget,
              ),
              title: Text(
                cardText,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                ),
              ),
              trailing: Icon(
                arrowForwardType,
                color: Theme.of(context).hintColor,
              ),
              onTap: () {
                cardPressed();
              }
          ),
        ),
      );
    });
  }
}
