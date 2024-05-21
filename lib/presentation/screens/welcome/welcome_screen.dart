
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/presentation/widgets/custom_ui/custom_uis.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
   _WelcomeScreenState createState() =>
      _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient:LinearGradient(
                    colors: [
                      AppColors.primaryLight,
                      AppColors.primaryLight.withOpacity(.85),
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.08,0.12,0.3, 1.0],
                    tileMode: TileMode.clamp)),
          ),
          SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * .05),
                    LogoWithTextWidget(
                      fontSize: 27,
                      logoWidth: 21,
                    ),
                    SizedBox(height: 20,),
                Image.asset('assets/images/cappAround.png',
                  fit: BoxFit.fitWidth,),
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 40),
                      child: Text(
                        'You get to Assess your Leaders',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet',
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                          width: size.width * .4,
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
                          width: size.width * .4,
                          paddingVertical: 12,
                          isActive: true,
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                ),

              ],
            ),


            // Stack(
            //   children: [
            //     Positioned(
            //       bottom: 0,
            //         child: Container(
            //       width: size.width,
            //       height: size.height * .5,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
            //       ),
            //     )),
            //   ],
            // ),
          )
        ],
      ),
    );
  }
}
