import 'package:capp/src/presentation/screens/explore/civic_education/components/get_badge_screen.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final int score, totalQuestions;
  const ResultScreen(
      {super.key, required this.score, required this.totalQuestions});

  exitDialog(BuildContext context) {
    CustomDialogWidgets.buildOperationStatusDialog(
        title: 'Please proceed to collect your badge',
        desc: '',
        onPositiveBtnTap: () {
          Get.off(() => const GetBadgeScreen());
        },
        positiveBtnTitle: 'Get a Badge',
        negativeBtnTitle: '',
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
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Great Job!",
                      style: TextStyle(
                          fontSize: 32,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "The Quiz is now complete",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 134,
                      width: 134,
                      child: Image.asset('assets/images/trophy.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    height: 120,
                    width: context.widthPercentage(0.96),
                    decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'You Scored',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '$score/$totalQuestions',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercentage(.15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CappCustomButton(
                      onPress: () => Get.off(() => const GetBadgeScreen()),
                      isSolidColor: true,
                      isActive: true,
                      color: AppColors.primary,
                      child: const Text(
                        'Get a badge',
                        style: TextStyle(
                          color: Colors.white,
                          // : Colors.white.withOpacity(.7),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
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
