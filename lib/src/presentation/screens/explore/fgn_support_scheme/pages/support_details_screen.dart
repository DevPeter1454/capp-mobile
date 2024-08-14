import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportDetailsScreen extends StatefulWidget {
  final String id;
  final String title;
  final String body;
  final String url;
  final bool isFavorite;
  final String acronym;
  const SupportDetailsScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.body,
      required this.url,
      required this.isFavorite,
      required this.acronym});

  @override
  State<SupportDetailsScreen> createState() => _SupportDetailsScreenState();
}

class _SupportDetailsScreenState extends State<SupportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CustomTopNavBar(title: widget.title),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Icon(Icons.favorite,
                        color: widget.isFavorite
                            ? AppColors.primary
                            : AppColors.appGrey),
                  )
                ],
              ),
              SizedBox(height: 12.h),
              Image.network(
                widget.url,
                height: 247.h,
                width: 327.w,
              ),
              SizedBox(height: 12.h),
              Text(widget.acronym,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color(0XFF19202D))),
              SizedBox(height: 24.h),
              CappCustomButton(
                  onPress: () {
                    // Navigator.pop(context);
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return const CappCustomBottomSheet();
                      },
                    );
                  },
                  color: AppColors.primary.withOpacity(0.10),
                  isSolidColor: true,
                  paddingVertical: 12,
                  isActive: true,
                  child: const Text(
                    'Share',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(height: 53.h),
              Text(
                widget.body,
                style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
