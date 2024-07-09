import 'package:capp/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileItemWidget extends StatelessWidget {
  final String cardText;
  final Function cardPressed;
  final Widget iconWidget;

  const ProfileItemWidget(
      {super.key,
      required this.cardText,
      required this.cardPressed,
      required this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return Container(
        height: 45,
        margin: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: ListTile(
              leading: iconWidget,
              title: Text(
                cardText,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                cardPressed();
              }),
        ),
      );
    });
  }
}
