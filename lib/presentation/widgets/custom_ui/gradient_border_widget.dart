
import 'package:flutter/material.dart';

class GradientBorderWidget extends StatelessWidget {
  final Widget child;
  const GradientBorderWidget({Key? key, required this.child, this.colors}) : super(key: key);
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ?? [
            const Color(0xFFEB0055),
            const Color(0xFFFFFA80),
          ],
        ),
        shape: BoxShape.circle
        // borderRadius: BorderRadius.circular(35),
      ),
      // height: 100,
      child: Padding(
        padding:  const EdgeInsets.all(1.5),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
                shape: BoxShape.circle
            ),
            child: Center(
              child: child
            ),
          ),
        ),
      ),
    );
  }
}
