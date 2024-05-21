import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/presentation/widgets/custom_ui/capp_custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccesUiScreen extends StatefulWidget {
  const SuccesUiScreen({super.key, required this.route});

  final String? route;

  @override
  State<SuccesUiScreen> createState() => _SuccesUiScreenState();
}

class _SuccesUiScreenState extends State<SuccesUiScreen> {
  String desc = '', route = '';

  @override
  void initState() {
    route = RouteConstants.success;
    if (widget.route == RouteConstants.setNewPass) {
      desc = 'Your password has been reset successfully';
    } else if (widget.route == RouteConstants.changePass) {
      desc = 'Your password has been updated successfully';
    } else if (widget.route == RouteConstants.setNewPin) {
      desc = 'Your transaction pin has been reset successfully';
    } else if (widget.route == RouteConstants.createPin) {
      desc = 'Your transaction pin has been created successfully';
    } else if (widget.route == RouteConstants.changePin) {
      desc = 'Your transaction pin has been updated successfully';
    } else {
      desc = 'Your account has been successfully created';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20, top: size.height * .1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '🎉🎉',
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.check_circle,
                  size: 130,
                  color: AppColors.appGrey.withOpacity(.7),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Center(
                child: CappCustomButton(
                  isActive: true,
                  onPress: () {
                    Get.toNamed(RouteConstants.login);
                    // if (widget.route == RouteConstants.signup) {
                    //   // Get.toNamed(RouteConstants.home);
                    // } else {
                    //   Get.back();
                    // }
                  },
                  color: AppColors.primary,
                  isSolidColor: true,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
