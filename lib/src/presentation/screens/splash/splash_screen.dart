import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _prefs = getIt.get<SharedPreferencesService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        getNextRoute();
      });
    });
  }

  void getNextRoute() async {
    try {
      if (_prefs.authToken == null) {
       
        Get.offNamed(RouteConstants.welcome);
      } else {
        Get.toNamed(RouteConstants.home);
      }
    } catch (e) {
      // print('Error $e');
      Get.toNamed(RouteConstants.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0D4740),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: 350,
              width: context.width,
              child: Image.asset(
                'assets/images/welcomebg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(.65),
                      Colors.white.withOpacity(.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.6, 0.8, 1.0],
                    tileMode: TileMode.clamp)),
          ),
          const Center(
            child: LogoWithTextWidget(
              isHorizontal: false,
              titleColor: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
