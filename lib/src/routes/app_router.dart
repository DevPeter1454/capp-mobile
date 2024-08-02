import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/presentation/screens/capp_success_screen.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/civic_education_screen.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/preview_book.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/view_all_books.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/view_all_videos.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/fgn_support_scheme_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/donation_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/join_party_user_detail_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/join_a_party_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/know_your_leader_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/know_your_mda_screen.dart';
import 'package:capp/src/presentation/screens/explore/policy_library/policy_library_screen.dart';
import 'package:capp/src/presentation/screens/forgotPassword/create_new_password_screen.dart';
import 'package:capp/src/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:capp/src/presentation/screens/login/login_screen.dart';
import 'package:capp/src/presentation/screens/signup/signup_screen.dart';
import 'package:capp/src/presentation/screens/signup/user_signup_detail_screen.dart';
import 'package:capp/src/presentation/screens/splash/splash_screen.dart';
import 'package:capp/src/presentation/screens/verifyOtp/verify_otp_screen.dart';
import 'package:capp/src/presentation/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

import '../presentation/screens/dashboard/dashboard_screen.dart';

class RouteGenerator {
  //-------------- Routes ----------------------//
  static List<GetPage> routes = [
    GetPage(
        name: RouteConstants.initialPage,
        page: () {
          return const SplashScreen();
        },
        transition: Transition.fadeIn),
    GetPage(name: RouteConstants.home, page: () => const DashboardScreen()),
    GetPage(name: RouteConstants.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: RouteConstants.createNewPassword, page: () => const CreateNewPasswordScreen()),

    GetPage(name: RouteConstants.welcome, page: () => const WelcomeScreen()),
    GetPage(name: RouteConstants.donationScreen, page: () => DonationScreen(id: Get.arguments)),
    GetPage(name: RouteConstants.joinPartyUserSignUpScreen, page: () => JoinPartyUserSignUpScreen(id: Get.arguments)),
    GetPage(name: RouteConstants.policyLibrary, page: () => const PolicyLibraryScreen()),
    GetPage(name: RouteConstants.fgnSupport, page: () => const FGNSupportScheme()),

    GetPage(name: RouteConstants.knowYourLeaders, page: () => const KnowYourLeader()),
    GetPage(name: RouteConstants.knowyourMDA, page: () => const KnowYourMDA()),
    GetPage(name: RouteConstants.joinParty, page: () => const JoinPartyScreen()),

    GetPage(name: RouteConstants.civicEducation, page: () => const CivicEducationScreen()),

    GetPage(
        name: RouteConstants.viewAllCivicBooks,
        page: () => ViewAllBooksScreen(
              loaded: Get.arguments,
            )),

    GetPage(name: RouteConstants.viewAllCivicVideo, page: () => const ViewAllVidoesScreen()),
    GetPage(name: RouteConstants.login, page: () => const LoginScreen()),
    GetPage(name: RouteConstants.signup, page: () => const SignUpScreen()),
    GetPage(
        name: RouteConstants.userDetails,
        page: () => UserSignUpDetailScreen(
              email: Get.arguments,
              password: Get.arguments,
            )),
    GetPage(name: RouteConstants.otpVerify, page: () => VerifyOtpScreen(route: Get.arguments)),
    GetPage(name: RouteConstants.success, page: () => CappSuccessScreen(arguments: Get.arguments)),
    GetPage(
        name: RouteConstants.previewBook,
        page: () => PreviewBookScreen(
              bookModel: Get.arguments,
            )),

    //-------------- unknown ----------------------//
  ];
}
