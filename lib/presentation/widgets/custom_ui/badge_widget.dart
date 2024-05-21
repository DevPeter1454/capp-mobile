import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key, required this.count, this.padding, this.fontSize,
  });
  final String count;
  final double? padding, fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      padding:  EdgeInsets.all(padding??3),
      child:  Center(
        child: Text(
          count,
          style: TextStyle(
              fontSize:fontSize?? 6, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}