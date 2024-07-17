import 'package:capp/src/presentation/widgets/custom_ui/capp_form_field.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PolicyLibraryScreen extends StatelessWidget {
  const PolicyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTopNavBar(title: "Back to home"),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/policy.svg',
                          height: 32.h,
                          width: 32.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Policy Library',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackTextColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Your centralized repository for policy documents, regulations and laws.',
                      style:
                          TextStyle(color: AppColors.descText, fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CappCustomFormField(
                      fillColor: const Color(0XFFF4F4F6),
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Color(0XFF828282),
                      ),
                      borderColor: Colors.transparent,
                      hintText: "Search by author, title, etc",
                      hintStyle: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Collection",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.blackTextColor,
                                      fontWeight: FontWeight.w600)),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/icons/add-circle.svg"),
                                Text("New Collection",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(height: 10.h),
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/folder-empty.svg"),
                            SizedBox(
                              height: 60.h,
                              width: 294.w,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Text(
                                        "No folder created yet, select ‘New Collection’",
                                        style: TextStyle(
                                            color: AppColors.descText,
                                            fontSize: 14.sp)),
                                    Text("to create a collection",
                                        style: TextStyle(
                                            color: AppColors.descText,
                                            fontSize: 14.sp)),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Books",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
                                              color: AppColors.blackTextColor,
                                              fontWeight: FontWeight.w600)),
                                  InkWell(
                                    onTap: () {
                                      // Get.to(());
                                    },
                                    child: Text("See All",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w600)),
                                  ),
                                ]),
                          ]),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
