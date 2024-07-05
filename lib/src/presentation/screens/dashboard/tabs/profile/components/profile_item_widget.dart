import 'package:flutter/material.dart';

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
  }
}
