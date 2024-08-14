import 'package:capp/src/domain/model/mda.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/read_all_info_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/continue_reading.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class MdaDetailsScreen extends StatefulWidget {
  final Mda mda;
  const MdaDetailsScreen({super.key, required this.mda});

  @override
  State<MdaDetailsScreen> createState() => _MdaDetailsScreenState();
}

class _MdaDetailsScreenState extends State<MdaDetailsScreen> {
  get calculateMaxLines {
    if (context.height <= 667) {
      return 10;
    } else if (context.height <= 746) {
      return 12;
    } else if (context.height <= 896) {
      return 15;
    } else {
      // Default case for heights greater than 844
      return 18;
    }
  }

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight - 205;
    } else if (context.height <= 746) {
      return availableHeight - 152;
    } else if (context.height <= 896) {
      return availableHeight - 88;
    } else if (context.height <= 915) {
      return availableHeight - 17;
    } else {
      // Default case for heights greater than 844
      return availableHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTopNavBar(title: widget.mda.ministryName),
                  SizedBox(height: 31.5.h),
                  Image.network(
                    widget.mda.ministryLogo,
                    height: 247.h,
                    width: double.infinity,
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
                  Flexible(
                      child: Text(
                    widget.mda.ministryName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  )),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: calculateMainAxisExtent(425),
                    child: ContinueReading(
                      content: widget.mda.ministryDescription ?? '',
                      maxline: calculateMaxLines,
                      onClickedContinueReading: () => Get.to(() =>
                          ReadAllInfoScreen(
                              title: widget.mda.ministryName,
                              content: widget.mda.ministryDescription)),
                    ),
                  ),
                  // SizedBox(height: 36.h),
                  Text(
                    "Minister",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 225.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              topRight: Radius.circular(8.r)),
                          child: Image.network(
                            widget.mda.ministryImage,
                            height: 185.h,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          )),
                      Flexible(
                        child: SizedBox(
                          height: 35.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.mda.ministerName,
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: 25.h)
                ]),
          ),
        ),
      ),
    ));
  }
}
