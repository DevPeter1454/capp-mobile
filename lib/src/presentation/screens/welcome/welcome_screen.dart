import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    AppColors.primaryLight,
                    AppColors.primaryLight.withOpacity(.85),
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: const [0.08, 0.12, 0.3, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.only(bottom: context.heightPercentage(.037)),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SizedBox(
                  height: context.height - 120,
                  child: ListView(
                    physics: context.height <= 667
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: context.heightPercentage(.05)),
                      const LogoWithTextWidget(
                        fontSize: 27,
                        logoWidth: 21,
                        titleColor: AppColors.primaryDark,
                      ),
                      Container(
                        height: context.heightPercentage(.04),
                      ),
                      Image.asset(
                        'assets/images/cappAround.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                        height: context.height > 850
                            ? context.heightPercentage(.08)
                            : context.heightPercentage(.04),
                      ),
                      context.width <= 360
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    'You Complete the Puzzle \nto Nigeria’s Greatness',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'You Complete the Puzzle  to Nigeria’s Greatness',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                      SizedBox(
                        height: context.heightPercentage(.01),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet',
                          style: TextStyle(
                              // color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightPercentage(.03),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CappCustomButton(
                            onPress: () {
                              Get.toNamed(RouteConstants.signup);
                            },
                            color: AppColors.primary,
                            isSolidColor: true,
                            width: context.widthPercentage(.4),
                            paddingVertical: 12,
                            isActive: true,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        CappCustomButton(
                          onPress: () {
                            Get.toNamed(RouteConstants.login);
                          },
                          color: AppColors.primary.withOpacity(.1),
                          isSolidColor: true,
                          width: context.widthPercentage(.4),
                          paddingVertical: 12,
                          isActive: true,
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
