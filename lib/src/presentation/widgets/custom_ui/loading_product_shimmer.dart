import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProductShimmerWidget extends StatelessWidget {
  const LoadingProductShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color:  Colors.white,
      // shadowColor: Theme.of(context).highlightColor.withOpacity(.4),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 4,
                child: Shimmer.fromColors(
                  // The baseColor and highlightColor creates a LinearGradient which would be painted over the child widget
                  baseColor: const Color(0xFFFECDD3).withOpacity(.8),
                  highlightColor: const Color(0xFFFECDD3).withOpacity(.4),
                  child: const Material(
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        height: 130,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 3, left: 3),
              child: Shimmer.fromColors(
                // The baseColor and highlightColor creates a LinearGradient which would be painted over the child widget
                baseColor: const Color(0xFFFECDD3).withOpacity(.8),
                highlightColor: const Color(0xFFFECDD3).withOpacity(.4),
                child: Container(
                  width: 90,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Shimmer.fromColors(
                // The baseColor and highlightColor creates a LinearGradient which would be painted over the child widget
                baseColor: const Color(0xFFFECDD3).withOpacity(.8),
                highlightColor: const Color(0xFFFECDD3).withOpacity(.4),
                child: Container(
                  width: 45,
                  height: 13,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFECDD3).withOpacity(.8),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 3, left: 3, right: 5),
              child: Shimmer.fromColors(
                // The baseColor and highlightColor creates a LinearGradient which would be painted over the child widget
                baseColor: const Color(0xFFFECDD3).withOpacity(.8),
                highlightColor: const Color(0xFFFECDD3).withOpacity(.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                          color: Colors.grey[400],),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}