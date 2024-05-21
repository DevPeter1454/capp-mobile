
import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class ProJobCustomInputContainerWidget extends StatelessWidget {
  const ProJobCustomInputContainerWidget({
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
    this.lastFlex = 2, this.fillColor, this.isValidated = false,  this.startWidget,  this.startFlex = 2,
  }) : super(key: key);

  final Function()? onPressed;
  final String? hint, mainText, errorText;
  final bool isActive, hasError, isValidated;
  final Widget? prefixWidget, suffixWidget, lastWidget, startWidget;
  final double? height, width, paddingLeft, paddingRight;
  final int prefixFlex, suffixFlex, lastFlex, startFlex;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer< ThemeProvider>(builder: (context, theme, child)
    {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
              decoration: BoxDecoration(
                  color: fillColor ?? Theme.of(context).inputDecorationTheme.fillColor,
                  border: hasError ? Border.all(width: 0.7, color: Colors.red) : Border.all(width: 0.7,
                      color: !isValidated ? theme.isDarkMode
                          ? const Color(0xFFCACBCA)
                          : const Color(0xFFA1A3A2)
                          : const Color(0xFF6FBE45)),
                  borderRadius: BorderRadius.circular(13)),
              width: width ?? size.width,
              height: height ?? 60,
              child: Padding(
                padding: EdgeInsets.fromLTRB(paddingLeft ?? 0, 3, paddingRight??0, 0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                          visible: startWidget != null,
                          child: Expanded(flex: startFlex, child: startWidget ?? const SizedBox())),
                      Expanded(
                        flex: prefixFlex,
                        child: prefixWidget ??
                            Text(
                              isActive ? mainText! : hint!,
                              style: TextStyle(
                                fontSize: 16,
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
                              Flexible(flex: suffixFlex, child: suffixWidget ?? const SizedBox())),
                      Visibility(
                          visible: lastWidget != null,
                          child: Expanded(flex: lastFlex, child: lastWidget ?? const SizedBox())),
                    ],
                  ),
                ),
              )),
        ),
        Visibility(
          visible: hasError && errorText!.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(errorText ?? '',  style: const TextStyle(
                fontSize: 10,
                color: Colors.red,
                fontWeight: FontWeight.w400),),
          ),
        )
      ],
    );});
  }
}
