

import 'package:flutter/material.dart';

import 'capp_custom_btn.dart';




class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    Key? key, required this.imgWidget, this.desc, this.height, this.btnTitle, this.onBtnPressed, this.paddingTop, this.btnState = true,
  }) : super(key: key);
  final Widget imgWidget;
  final String? desc, btnTitle;
  final double? height, paddingTop;
  final Function()? onBtnPressed;
  final bool btnState;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height:paddingTop ?? size.height * .15,),
        Container(
          height:height ?? size.height * .55,
          width: size.width,
          child: Center(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              // mainAxisAlignment:
              // MainAxisAlignment.center,
              children: [
                imgWidget,
                SizedBox(
                  height: 15,
                ),
                Text(
                  desc ?? 'No items found',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.w500,
                      color: Theme.of(context)
                          .hintColor),
                ),
                Visibility(
                  visible: onBtnPressed!=null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(height: 45,),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CappCustomButton(
                            isActive: btnState,
                            onPress: onBtnPressed,
                            color: Theme
                                .of(context)
                                .highlightColor,
                            isSolidColor: true,
                            child: Text(
                              btnTitle ?? 'Proceed',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
