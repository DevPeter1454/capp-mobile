import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CivicBooksCardView extends StatelessWidget {
  final String title, imageUrl, time, numofPages, author, category;
  final Function()? onClickedRead;
  const CivicBooksCardView({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.numofPages,
    required this.author,
    required this.category,
    required this.onClickedRead,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: AppColors.descText.withOpacity(.3),
                  borderRadius: BorderRadius.circular(8.r)),
            ),
            Positioned(
              top: 4,
              left: 5,
              child: Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageUrl), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(8.r))),
            )
          ],
        ),
        SizedBox(
          width: context.width > 375
              ? context.widthPercentage(.026)
              : context.widthPercentage(.015),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColors.descText),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0XFF19202D)),
            ),
            Text(
              'Author: $author',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.descText),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                SizedBox(
                  height: 17.h,
                  width: 33.w,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/book-saved.svg',
                        height: 16.h,
                        width: 16.w,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(numofPages,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              color: AppColors.descText))
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                  height: 17,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/microphone.svg'),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(time,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.descText))
                    ],
                  ),
                ),
                SizedBox(
                  width: context.widthPercentage(.025),
                ),
                CappCustomButton(
                  onPress: onClickedRead,
                  color: AppColors.primary.withOpacity(.1),
                  isSolidColor: true,
                  width: 55.w,
                  height: 26.h,
                  paddingVertical: 4.h,
                  isActive: true,
                  child: Text(
                    'Read',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
        Positioned(
          top: 0,
          child: SvgPicture.asset("assets/icons/more.svg"),
        )
      ],
    );
  }
}
