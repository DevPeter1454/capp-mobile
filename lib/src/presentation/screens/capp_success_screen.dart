import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_btn.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CappSuccessScreen extends StatefulWidget {
  const CappSuccessScreen({super.key, required this.arguments});

  final Arguments arguments;

  @override
  State<CappSuccessScreen> createState() => _CappSuccessScreenState();
}

class _CappSuccessScreenState extends State<CappSuccessScreen> {
  String desc = '', route = '', btnName = '';

  @override
  void initState() {
    route = RouteConstants.success;
    if (widget.arguments.name == RouteConstants.createNewPassword) {
      desc = 'Your password has been reset successfully';
      btnName = 'Login';
    } else if (widget.arguments.name == RouteConstants.changePassword) {
      desc = 'Your password has been updated successfully';
      btnName = 'Login';
    } else if (widget.arguments.name ==
        RouteConstants.joinPartyUserSignUpScreen) {
      desc = 'You have successfully joined this Party';
      btnName = 'Back';
    } else if (widget.arguments.name == RouteConstants.donationScreen) {
      desc = 'You have successfully donated to this Party';
      btnName = 'Back';
    } else {
      desc = 'Your account have successfully completed sign up';
      btnName = 'Login';
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
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
                const SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 130,
                  color: AppColors.appGrey.withOpacity(.7),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Center(
                child: CappCustomButton(
                  isActive: true,
                  onPress: widget.arguments.callBack,
                  color: AppColors.primary,
                  isSolidColor: true,
                  child: Text(
                    btnName,
                    style: const TextStyle(
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
