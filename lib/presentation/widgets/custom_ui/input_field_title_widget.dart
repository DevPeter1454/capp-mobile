
import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';

import 'custom_uis.dart';


class InputFieldColumnWidget extends StatelessWidget {
  const InputFieldColumnWidget({
    Key? key,
    required this.inputFieldWidget,
    this.inputFieldTitle, this.showLoader = false, this.errorText, this.hasError = false, this.titleSuffixWidget, this.bottomWidget,
    this.showTip, this.toolTipKey, this.toolTipMessage = '', this.textColor, this.bgColor, this.paddingBtwTextAndInput,
  }) : super(key: key);
  final Widget inputFieldWidget;
  final Widget? titleSuffixWidget, bottomWidget;
  final String? inputFieldTitle,toolTipMessage,  errorText;
  final bool showLoader, hasError;
  final Function? showTip;
  final GlobalKey? toolTipKey;
  final Color? textColor, bgColor;
  final double? paddingBtwTextAndInput;

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
                    inputFieldTitle!,
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor?? Colors.black,
                      fontWeight: FontWeight.w400,),
                  ),
                  const SizedBox(width: 8,),
                  Visibility(
                      visible: showLoader,
                      child: const SizedLoaderWidget()),
                  showTip != null && toolTipKey!=null
                      && toolTipMessage!=null ? GestureDetector(
                    onTap: (){
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
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                      decoration: const BoxDecoration(

                          color:Colors.white,
                          borderRadius:  BorderRadius.all(Radius
                              .circular(10))),
                      child: Icon(
                        Icons.info,
                        color: Theme
                            .of(context)
                            .hintColor
                            .withOpacity(.8),
                        size: 15,
                      ),
                    ),
                  ) : Container(),
                ],
              ),
              const SizedBox(width: 10,),
              titleSuffixWidget ?? const Spacer()
            ],
          ),
           SizedBox(
            height: paddingBtwTextAndInput ?? 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputFieldWidget,
              Visibility(
                visible: hasError && errorText != null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(errorText ?? '', style: const TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.w400),),
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
