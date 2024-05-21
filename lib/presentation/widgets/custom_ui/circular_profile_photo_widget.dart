import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';
class CircularProfilePhotoWidget extends StatelessWidget {
  const CircularProfilePhotoWidget({
    super.key,
    required this.imageUrl, this.errorWidget, this.loadWidget,
  });

  final String imageUrl;
  final Widget? errorWidget, loadWidget;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(imageUrl,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return loadWidget ?? Container(
            color: AppColors.primary.withOpacity(.3),
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                strokeWidth: 2,
                color: Colors.white,
              ),
            ),
          );
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return errorWidget ?? const Icon(Icons.person, color: Colors.white,);
        },
      ),
    );
  }
}