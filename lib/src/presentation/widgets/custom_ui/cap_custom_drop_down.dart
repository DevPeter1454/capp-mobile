import 'package:flutter/material.dart';

class CappCustomDropDown extends StatelessWidget {
  const CappCustomDropDown({
    Key? key,
    required this.selectedItem,
    required this.dropDownList,
    this.hintText,
    this.onValueChanged,
    this.height,
    this.width,
    this.hintWidget,
    this.valueWidget,
    this.hasNoBorder = false,
    this.isEnabled = true,
    this.selectedItemBuilder,
    this.iconEnabledColor,
    this.hintStyle,
    this.textStyle,
    this.iconSize,
    this.containerBgColor,
    this.borderRaduis,
    this.isValidated = false,
    this.hasBorderLine = true,
    this.isOutlineIcon = false,
    this.padding,
  }) : super(key: key);

  final dynamic selectedItem;
  final String? hintText;
  final List<dynamic> dropDownList;
  final ValueChanged? onValueChanged;
  final double? height, width, iconSize, borderRaduis;
  final Widget? hintWidget;
  final Function? valueWidget;
  final bool hasNoBorder, isEnabled, isValidated, hasBorderLine, isOutlineIcon;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Color? iconEnabledColor, containerBgColor;
  final TextStyle? hintStyle, textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasNoBorder
          ? null
          : BoxDecoration(
              color: containerBgColor ??
                  Theme.of(context).inputDecorationTheme.fillColor,
              borderRadius: BorderRadius.circular(borderRaduis ?? 10),
              border: hasBorderLine
                  ? Border.all(
                      width: 0.7,
                      color: !isValidated
                          ? const Color(0xFFA1A3A2)
                          : const Color(0xFF6FBE45))
                  : null),
      height: height ?? 60,
      width: width,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: isOutlineIcon
              ? DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: selectedItem,
                  selectedItemBuilder: selectedItemBuilder,
                  items: dropDownList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      enabled: isEnabled,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: valueWidget != null
                            ? valueWidget!(value)
                            : Text(
                                value.toString(),
                                style: textStyle ??
                                    const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(20),
                  hint: hintWidget ??
                      Text(
                        hintText ?? 'Select',
                        style: hintStyle ??
                            TextStyle(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(.6)),
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: iconSize,
                  ),
                  iconEnabledColor:
                      iconEnabledColor ?? Colors.black.withOpacity(.6),
                  iconDisabledColor: Colors.black.withOpacity(.2),
                  onChanged: isEnabled ? onValueChanged : null,
                )
              : DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: selectedItem,
                  selectedItemBuilder: selectedItemBuilder,
                  items: dropDownList.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      enabled: isEnabled,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: valueWidget != null
                            ? valueWidget!(value)
                            : Text(
                                value.toString(),
                                style: textStyle ??
                                    const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                              ),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(20),
                  hint: hintWidget ??
                      Text(
                        hintText ?? 'Select',
                        style: hintStyle ??
                            TextStyle(
                                color: Theme.of(context)
                                    .hintColor
                                    .withOpacity(.6)),
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: iconSize ?? 20,
                    color:
                        isEnabled ? Colors.black : Colors.black.withOpacity(.3),
                  ),
                  iconEnabledColor: iconEnabledColor ??
                      const Color(0xFFCFDAD9).withOpacity(.7),
                  iconDisabledColor: const Color(0xFFCFDAD9).withOpacity(.2),
                  onChanged: isEnabled ? onValueChanged : null,
                ),
        ),
      ),
      //
    );
  }
}
