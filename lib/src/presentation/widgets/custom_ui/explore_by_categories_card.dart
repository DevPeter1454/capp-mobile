import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreByCategoryCard extends StatelessWidget {
  const ExploreByCategoryCard({
    super.key,
    required this.title,
    required this.image,
    required this.ctnColor,
    this.onTap,
  });
  final String title, image;
  final Color ctnColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ctnColor,
            ),
            height: 122.h,
            width: 155.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: SvgPicture.asset(image),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 42.h,
                  width: 108.w,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp, color: AppColors.blackTextColor),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
