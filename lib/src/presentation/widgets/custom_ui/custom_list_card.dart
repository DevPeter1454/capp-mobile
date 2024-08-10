import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListCard extends StatelessWidget {
  final String? title, acroymn, officeHolderName, politicalPartyImageUrl, mdaImageUrl;
  final bool isKnowMDA;
  final bool isIconLeft;
  final double ctnheight, ctnWidth;
  final Function()? onClickedPrimaryActionButton;
  const CustomListCard(
      {super.key,
      required this.title,
      this.acroymn,
      this.officeHolderName,
      this.politicalPartyImageUrl,
      required this.isKnowMDA,
      this.isIconLeft = true,
      this.onClickedPrimaryActionButton,
      this.mdaImageUrl,
      this.ctnheight = 120,
      this.ctnWidth = 120});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isKnowMDA
            ? CircleAvatar(
                radius: 42.r,
                backgroundColor: AppColors.primaryLight,
                backgroundImage: NetworkImage(mdaImageUrl!),
              )
            : Image.network(politicalPartyImageUrl!, height: ctnheight, width: ctnWidth, fit: BoxFit.cover,
               loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
        SizedBox(
          width: 12.w,
        ),
        SizedBox(
          width: context.widthPercentage(.386),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 215.w,
                child: Text(
                  title!,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColors.blackTextColor),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                acroymn ?? '',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp, color: AppColors.descText),
              ),
              SizedBox(
                width: 10.h,
              ),
              SizedBox(
                height: 17.h,
                child: officeHolderName == null
                    ? const SizedBox.shrink()
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          isKnowMDA ? 'Minister' : 'Office:',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp, color: AppColors.descText),
                        ),
                      ),
              ),
              SizedBox(
                width: 25.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  officeHolderName ?? '',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11.sp, color: const Color(0XFF4F4F4F)),
                ),
              ),
            ],
          ),
        ),
        isIconLeft
            ? SizedBox(
                width: 59.w,
              )
            : SizedBox(
                width: 45.w,
              ),
        Expanded(
          child: GestureDetector(
            onTap: onClickedPrimaryActionButton,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: isIconLeft
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.descText,
                          size: 18.sp,
                        )
                      : Image.asset(
                          'assets/images/arrow-down.png',
                        ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
