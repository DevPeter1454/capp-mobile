import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidgetWithShimmerLoader extends StatelessWidget {
  const ImageWidgetWithShimmerLoader(
      {Key? key, required this.image, this.loadingWidget, this.errorWidget, this.height, this.width, this.highlightColor, this.baseColor})
      : super(key: key);
  final String image;
  final Widget? loadingWidget, errorWidget;
  final double? height, width;
  final Color? highlightColor, baseColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.network(
          image,
          height: height ?? 130,
          width: width ?? 130,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return loadingWidget ??
                Shimmer.fromColors(
                  baseColor: baseColor ?? Colors.grey[700]!,
                  highlightColor: highlightColor ?? Colors.grey[300]!,
                  child: Material(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Center(
                        child: SizedBox(
                          width: width ?? 100,
                          height: height ?? 100,
                        ),
                      ),
                    ),
                  ),
                );
          },
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return errorWidget ??
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Center(
                        child: SizedBox(
                            width: (width ?? 100) - 30,
                            height: (height ?? 100) - 30,
                            child: Image.asset(
                              'assets/images/logoArt.png',
                            ))));
          },
        ));
  }
}
