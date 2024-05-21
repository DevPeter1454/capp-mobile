
import 'package:flutter/material.dart';

import 'custom_checkbox_widget.dart';


class CheckboxTextWidget extends StatelessWidget {
  const CheckboxTextWidget({
    Key? key,
    required this.isActive, required this.onCheckChanged, required this.desc, this.onTextPressed, this.style,
  }) : super(key: key);

  final bool isActive;
  final ValueChanged onCheckChanged;
  final String desc;
  final Function()? onTextPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CPCheckBoxWidget(check: isActive, onCheckChanged: onCheckChanged),
        Flexible(
          child: GestureDetector(
            onTap: onTextPressed,
            child: Text(
              desc,
              style: style ??TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

