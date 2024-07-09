import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBadgeScreen extends StatelessWidget {
  const GetBadgeScreen({super.key});

  exitDialog(BuildContext context) {
    CustomDialogWidgets.buildOperationStatusDialog(
        title: 'Please proceed to the dashboard',
        desc: '',
        onPositiveBtnTap: () => Get.offNamed(RouteConstants.home),
        positiveBtnTitle: 'Yes',
        negativeBtnTitle: 'No',
        onNegativeBtnTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 85, 15, 0),
              child: ListView(
                physics: context.height < 730
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 299,
                    width: 294,
                    decoration: BoxDecoration(
                        color: AppColors.inputHint.withOpacity(.4),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const LogoWithTextWidget(
                          fontSize: 24,
                          logoWidth: 21,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset('assets/images/logo.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 9.0),
                          child: Container(
                            height: 40,
                            width: context.widthPercentage(0.46),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: context.widthPercentage(.3),
                                  child: const Text(
                                    'Precious Batta',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 5,
                                  ),
                                ),
                                Image.asset('assets/images/tick-circle.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  GestureDetector(
                    onTap: () {
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
                    child: Container(
                      height: 50,
                      width: context.widthPercentage(0.46),
                      decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Share Badge',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset('assets/images/send_green.png'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercentage(.27),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CappCustomButton(
                      onPress: () => Get.offNamed(RouteConstants.home),
                      isSolidColor: true,
                      isActive: true,
                      color: AppColors.primary,
                      child: const Text('Go to Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            // : Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
