import 'package:capp/src/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:flutter/material.dart';

class InputFieldColumnWidget extends StatelessWidget {
  const InputFieldColumnWidget({
    Key? key,
    this.inputFieldWidget,
    this.inputFieldTitle,
    this.showLoader = false,
    this.errorText,
    this.hasError = false,
    this.titleSuffixWidget,
    this.bottomWidget,
    this.showTip,
    this.toolTipKey,
    this.toolTipMessage = '',
    this.textColor,
    this.bgColor,
  }) : super(key: key);
  final Widget? inputFieldWidget, titleSuffixWidget, bottomWidget;
  final String? inputFieldTitle, toolTipMessage, errorText;
  final bool showLoader, hasError;
  final Function? showTip;
  final GlobalKey? toolTipKey;
  final Color? textColor, bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    inputFieldTitle ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Visibility(
                      visible: showLoader, child: const SizedLoaderWidget()),
                  showTip != null &&
                          toolTipKey != null &&
                          toolTipMessage != null
                      ? GestureDetector(
                          onTap: () {
                            showTip!();
                          },
                          child: Tooltip(
                            key: toolTipKey,
                            message: toolTipMessage,
                            waitDuration: const Duration(seconds: 1),
                            showDuration: const Duration(seconds: 2),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 25,
                            verticalOffset: 5,
                            triggerMode: TooltipTriggerMode.tap,
                            preferBelow: true,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(.15),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(2, 1))
                              ],
                              color: Theme.of(context).indicatorColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Icon(
                              Icons.info,
                              color:
                                  Theme.of(context).hintColor.withOpacity(.8),
                              size: 15,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              titleSuffixWidget ?? const Spacer()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     decoration: BoxDecoration(
              //         color: bgColor ?? Theme
              //             .of(context)
              //             .inputDecorationTheme
              //             .fillColor,
              //         border: hasError ? Border.all(
              //             width: 1, color: Colors.red) : null,
              //         borderRadius: BorderRadius.circular(13)),
              //     child: inputFieldWidget),
              inputFieldWidget ?? const SizedBox(),
              Visibility(
                visible: hasError && errorText != null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    errorText ?? '',
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.red,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Visibility(
                visible: bottomWidget != null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: bottomWidget,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
