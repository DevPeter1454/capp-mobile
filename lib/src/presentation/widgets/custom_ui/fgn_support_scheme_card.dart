import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/pages/favorites_added.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FgnSupportSchemeCard extends StatelessWidget {
  final String logoUrl;
  final String title;
  final String acronym;
  const FgnSupportSchemeCard({
    Key? key,
    required this.logoUrl,
    required this.title,
    required this.acronym,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
            child: Image.network(
              logoUrl,
              height: 60.h,
              width: 60.w,
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
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 215.w,
                  height: 42.h,
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  )),
              SizedBox(height: 8.h),
              Text("Acronym:",
                  style: TextStyle(
                      fontSize: 11.sp, color: const Color(0XFFBDBDBD))),
              Text(acronym,
                  style: TextStyle(
                      fontSize: 11.sp, color: const Color(0XFF4F4F4F)))
            ],
          ),
          Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 252.h,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Add to Favorites",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600)),
                                        SvgPicture.asset(
                                            "assets/icons/close.svg"),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(.6),
                                    thickness: 0.2,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 16.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Add Selected support scheme to favorites",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.descText),
                                          ),
                                          SizedBox(height: 50.h),
                                          // const Spacer(),
                                          CappCustomButton(
                                              onPress: () {
                                                Navigator.pop(context);
                                                Get.to(
                                                    () =>
                                                        const FavoritesAddedScreen(),
                                                    transition:
                                                        Transition.fade);
                                              },
                                              color: AppColors.primary,
                                              isSolidColor: true,
                                              paddingVertical: 12,
                                              isActive: true,
                                              child: const Text(
                                                'Add to Favorite',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: 20.w, vertical: 10.h),
                            );
                          });
                    },
                    child: SvgPicture.asset("assets/icons/more.svg")),
                SizedBox(
                  height: 35.h,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.descText,
                  size: 18.sp,
                ),
              ])
        ],
      ),
    );
  }
}
