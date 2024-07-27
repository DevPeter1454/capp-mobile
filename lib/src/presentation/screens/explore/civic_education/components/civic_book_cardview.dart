import 'package:capp/src/domain/model/civic_education_model.dart';
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
  final Function()? onMoreClicked;
  const CivicBooksCardView(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.time,
      required this.numofPages,
      required this.author,
      required this.category,
      required this.onClickedRead,
      this.onMoreClicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(color: AppColors.descText.withOpacity(.3), borderRadius: BorderRadius.circular(8.r)),
          child: Positioned(
            top: 4,
            left: 5,
            child: Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.fitHeight), borderRadius: BorderRadius.circular(8.r))),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, color: AppColors.descText),
              ),
              SizedBox(
                height: 8.h,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, color: const Color(0XFF19202D)),
                ),
              ),
              Text(
                'Author: $author',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10.sp, color: AppColors.descText),
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
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          numofPages,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp, color: AppColors.descText),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/microphone.svg'),
                      SizedBox(
                        width: 2.w,
                      ),
                      const Text("5h 20min", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: AppColors.descText))
                    ],
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
                      style: TextStyle(color: AppColors.primary, fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: InkWell(
            onTap: () {
              if (onMoreClicked != null) {
                onMoreClicked?.call();
              }
            },
            child: SvgPicture.asset("assets/icons/more.svg"),
          ),
        )
      ],
    );
  }
}
