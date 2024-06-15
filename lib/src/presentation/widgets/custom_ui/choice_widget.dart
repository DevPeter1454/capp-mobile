
import 'dart:ui';

import 'package:flutter/material.dart';


class CPChoiceSelector extends StatefulWidget {

  final ValueChanged switchTab;
  final List<String> titleList;
  final double activeFontSize;
  final double inActiveFontSize, paddingAll;
  final int selectedIndex;
  final bool showUnderline;
  final Color? activeColor, inActiveColor;

  const CPChoiceSelector(
      {Key? key,
        required this.switchTab,
        required this.titleList,
        this.activeFontSize = 16,
        this.inActiveFontSize = 16,
        this.selectedIndex = 0,
        this.showUnderline = true,
        this.activeColor,
        this.inActiveColor,
        this.paddingAll = 4})
      : super(key: key);

  @override
  State<CPChoiceSelector> createState() => _CPChoiceSelectorState();
}

class _CPChoiceSelectorState extends State<CPChoiceSelector> {

  @override
  Widget build(BuildContext context) {
    var screenSize = window.physicalSize;
    Size size = MediaQuery.of(context).size;
    final itemWidth = (size.width * .85) / widget.titleList.length;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: size.width ,
        child: Row(
          // mainAxisAlignment:
          // MainAxisAlignment.spaceAround,
          children: widget.titleList
              .asMap()
              .entries
              .map(
                  (e) {
                var isTabActive = widget.selectedIndex == e.key;
                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   widget.selectedIndex = e.key;
                    // });
                    widget.switchTab(e.key);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(widget.paddingAll),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 5),
                        width: itemWidth,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: isTabActive
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).highlightColor.withOpacity(.2),
                          ),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                            child: Text(
                              e.value,
                              style: TextStyle(
                                  color: !isTabActive ? widget.inActiveColor ?? Theme.of(context).hintColor
                                      : widget.activeColor ??  Theme.of(context).highlightColor,
                                  fontWeight: !isTabActive
                                      ? FontWeight.w300
                                      : FontWeight.w600,
                                  fontSize: !isTabActive ? widget.inActiveFontSize :  widget.activeFontSize),
                            )),
                      )),
                );
              }
          )
              .toList(),
        ),
      ),
    );
  }
}
