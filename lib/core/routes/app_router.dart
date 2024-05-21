
import 'package:capp/presentation/screens/newPassword/main_create_new_password_screen.dart';
import 'package:capp/presentation/screens/signup/section_two_signup_screen.dart';
import 'package:capp/presentation/screens/success_ui.dart';
import 'package:capp/presentation/screens/verifyOtp/main_verify_otp_screen.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/presentation/screens/checkOut/main_checkout_screen.dart';
import 'package:capp/presentation/screens/dashboard/tabs/wallets/main_wallets_tab.dart';
import 'package:capp/presentation/screens/forgotPassword/main_forgot_password_screen.dart';
import 'package:capp/presentation/screens/login/main_login_screen.dart';
import 'package:capp/presentation/screens/makeSchedule/main_schedule_for_service_screen.dart';
import 'package:capp/presentation/screens/serviceInfo/main_service_details_screen.dart';
import 'package:capp/presentation/screens/signup/main_signup_screen.dart';
import 'package:capp/presentation/screens/splash/splash_screen.dart';
import 'package:capp/presentation/screens/welcome/welcome_screen.dart';

import '../../presentation/screens/dashboard/main_dashboard_screen.dart';


class RouteGenerator {

 //-------------- Routes ----------------------//
 static List<GetPage> routes = [
  GetPage(name: RouteConstants.initialPage , page: (){
   return const SplashScreen();
  },
  transition: Transition.fadeIn 
  ),
  GetPage(name: RouteConstants.home, page: ()=> const MainDashboardScreen()),
  GetPage(name: RouteConstants.forgotPass, page: ()=> const MainForgotPasswordScreen()),
  GetPage(name: RouteConstants.setNewPass, page: ()=> const MainCreateNewPasswordScreen()),
  GetPage(name: RouteConstants.serviceDetails, page: ()=>  MainServiceDetailsScreen(
   serviceName: Get.arguments,
  )),
  GetPage(name: RouteConstants.welcome, page: ()=>  const WelcomeScreen(
  )),

  GetPage(name: RouteConstants.makeSchedule, page: ()=> const MainScheduleForServiceScreen()),
  GetPage(name: RouteConstants.checkOut, page: ()=> const MainCheckOutScreen()),
  GetPage(name: RouteConstants.wallet, page: ()=> const MainWalletTab()),




  GetPage(name: RouteConstants.login, page: ()=> const MainLoginScreen()),
  GetPage(name: RouteConstants.signup, page: ()=> const MainSignUpScreen()),
  GetPage(name: RouteConstants.signup2, page: ()=> const SectionTwoSignUpScreen()),
  GetPage(name: RouteConstants.otpVerify, page: ()=> const MainVerifyOtpScreen()),
  GetPage(name: RouteConstants.success, page: ()=>  SuccesUiScreen(route: Get.arguments)),


  // GetPage(name: RouteConstants.welcome, page: ()=> const WelcomeScreen()),
 ];

}

