import 'package:flutter/material.dart';

class ProJobViewPagerIndicator extends StatefulWidget {
  final ValueChanged switchTab;
  final List<String> titleList;
  final double activeFontSize;
  final double inActiveFontSize, paddingAll;
  final int selectedIndex;
  final bool showUnderline;
  final Color? activeColor, inActiveColor;

  const ProJobViewPagerIndicator(
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
  State<ProJobViewPagerIndicator> createState() =>
      _ProJobViewPagerIndicatorState();
}

class _ProJobViewPagerIndicatorState extends State<ProJobViewPagerIndicator> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final itemWidth = (size.width * .85) / widget.titleList.length;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.titleList.asMap().entries.map((e) {
            var isTabActive = widget.selectedIndex == e.key;
            return GestureDetector(
              onTap: () {
                widget.switchTab(e.key);
              },
              child: Padding(
                  padding: EdgeInsets.all(widget.paddingAll),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                            child: Text(
                          e.value,
                          style: TextStyle(
                              color: !isTabActive
                                  ? widget.inActiveColor ??
                                      Colors.black.withOpacity(.5)
                                  : widget.activeColor ?? Colors.black,
                              fontWeight: !isTabActive
                                  ? FontWeight.w300
                                  : FontWeight.w600,
                              fontSize: !isTabActive
                                  ? widget.inActiveFontSize
                                  : widget.activeFontSize),
                        )),
                      ),
                      // SizedBox(height: 8,),
                      Visibility(
                        visible: widget.showUnderline,
                        child: Container(
                          height: 4,
                          width: itemWidth,
                          // margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: ShapeDecoration(
                              color:
                                  isTabActive ? Colors.red : Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              )),
                        ),
                      )
                    ],
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
