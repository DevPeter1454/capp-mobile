import 'package:capp/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_btn.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritesAddedScreen extends StatelessWidget {
  const FavoritesAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              height: 60.h,
              width: 303.w,
              child: Text(
                "You have Successfully added support scheme to Folder",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            SizedBox(
                height: 170.h,
                width: 170.w,
                child: const Image(
                    image: AssetImage(
                  "assets/images/success.gif",
                ))),
            SizedBox(
              height: 120.h,
            ),
            CappCustomButton(
                onPress: () {
                  Navigator.pop(context);
                  Get.off(() => const DashboardScreen(),
                      transition: Transition.fade);
                },
                color: AppColors.primary,
                isSolidColor: true,
                paddingVertical: 12,
                isActive: true,
                child: const Text(
                  'Go to Dashboard',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: 60.h,
            ),
            // const Spacer(),
          ],
        ),
      ),
    ));
  }
}
