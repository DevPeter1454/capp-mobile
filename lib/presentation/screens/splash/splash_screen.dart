
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/cache.dart';
import 'package:capp/core/constants/constants.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), (){
        getNextRoute();
      });
    });
  }

  void getNextRoute() async{
    try{
      bool hasRun = await Cache.readData(AppConstants.HAS_RUN) ?? false;
      if(!hasRun){
        // Get.toNamed(RouteConstants.onboarding);
        Get.toNamed(RouteConstants.welcome);
      }else{
        // bool hasLogin = await Cache.readData(AppConstants.HAS_LOGIN)?? false;
        // if(hasLogin){
        //   Get.toNamed(RouteConstants.login);
        // }else{
        //   Get.toNamed(RouteConstants.signup);
        // }
      }
    }catch(e){
      print('Error $e');
      Get.toNamed(RouteConstants.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Scaffold(
        // backgroundColor: Color(0xFF0D4740),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 350,
                width: size.width,
                child: Image.asset('assets/images/welcomebg.png',
                fit: BoxFit.fitWidth,),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(.65),
                      Colors.white.withOpacity(.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6,0.8, 1.0],
                    tileMode: TileMode.clamp)),
              ),
            const Center(
              child: LogoWithTextWidget(),
            ),
          ],
        ),
      );
    });
  }
}
