import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CappCustomButton extends StatelessWidget {
  final bool isActive;
  final Function()? onPress;
  final Widget child;
  final double? width;
  final double borderWidth;
  final Color color, borderColor, shadowColor, secGradientColor;
  final double paddingVertical, borderRadius;
  final bool showShadow, hasBorder, isSolidColor;

  const CappCustomButton(
      {Key? key,
      this.isActive = false,
      required this.onPress,
      required this.child,
      this.width,
      this.color = AppColors.primary,
      this.showShadow = false,
      this.paddingVertical = 12,
      this.hasBorder = false,
      this.borderColor = const Color(0xFF012340),
      this.borderWidth = 1,
      this.shadowColor = Colors.blue,
      this.isSolidColor = false,
      this.secGradientColor = const Color(0xFF035FAE),
      this.borderRadius = 8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: isActive ? onPress : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: !isSolidColor
              ? null
              : hasBorder
                  ? Colors.transparent
                  : isActive
                      ? color
                      : color.withOpacity(.3),
          gradient: !isSolidColor
              ? LinearGradient(
                  colors: [
                    hasBorder
                        ? Colors.transparent
                        : isActive
                            ? color
                            : color.withOpacity(.3),
                    hasBorder
                        ? Colors.transparent
                        : isActive
                            ? secGradientColor
                            : secGradientColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp)
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          border: hasBorder
              ? Border.all(
                  width: borderWidth,
                  color: isActive ? borderColor : borderColor.withOpacity(.4))
              : null,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    offset: const Offset(2.0, 5.0),
                    blurRadius: 9.0,
                    spreadRadius: 5.0,
                    color: hasBorder
                        ? Colors.transparent
                        : !isActive
                            ? shadowColor.withOpacity(.1)
                            : shadowColor.withOpacity(.2),
                  )
                ]
              : [],
        ),
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        width: width ?? size.width,
        child: Center(child: child),
      ),
    );
  }
}
