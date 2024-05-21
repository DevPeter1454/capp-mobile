

import 'package:flutter/material.dart';


class TrovexxCustomInputContainerWidget extends StatelessWidget {
  const TrovexxCustomInputContainerWidget({
    Key? key,
    this.onPressed,
    this.hint,
    this.mainText,
    this.isActive = false,
    this.suffixWidget,
    this.prefixWidget,
    this.height,
    this.paddingLeft = 15,
    this.paddingRight = 15,
    this.hasError = false,
    this.errorText = '',
    this.width,
    this.prefixFlex = 6,
    this.suffixFlex = 4,
    this.lastWidget,
    this.lastFlex = 2, this.fillColor, this.isValidated = false,
  }) : super(key: key);

  final Function()? onPressed;
  final String? hint, mainText, errorText;
  final bool isActive, hasError, isValidated;
  final Widget? prefixWidget, suffixWidget, lastWidget;
  final double? height, width, paddingLeft, paddingRight;
  final int prefixFlex, suffixFlex, lastFlex;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
              decoration: BoxDecoration(
                  color: fillColor ?? Color(0xFFF3F4F8),
                  border: hasError ? Border.all(width: 0.7, color: Colors.red) : Border.all(width: 0.7,
                      color: !isValidated ? Colors.transparent
                          : Color(0xFF6FBE45)),
                  borderRadius: BorderRadius.circular(13)),
              width: width ?? size.width,
              height: height ?? 55,
              child: Padding(
                padding: EdgeInsets.fromLTRB(paddingLeft!, 3, paddingRight!, 0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: prefixFlex,
                        child: prefixWidget ??
                            Text(
                              isActive ? mainText! : hint!,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: isActive
                                      ? null
                                      : Theme.of(context)
                                      .hintColor
                                      .withOpacity(.6)),
                            ),
                      ),
                      Visibility(
                          visible: suffixWidget != null,
                          child:
                          Flexible(flex: suffixFlex, child: suffixWidget??SizedBox())),
                      Visibility(
                          visible: lastWidget != null,
                          child: Expanded(flex: lastFlex, child: lastWidget??SizedBox())),
                    ],
                  ),
                ),
              )),
        ),
        Visibility(
          visible: hasError && errorText!.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(errorText ?? '',  style: TextStyle(
                fontSize: 10,
                color: Colors.red,
                fontWeight: FontWeight.w400),),
          ),
        )
      ],
    );
  }
}
