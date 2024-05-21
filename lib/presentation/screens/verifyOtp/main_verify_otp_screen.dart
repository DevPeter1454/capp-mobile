
import 'dart:async';

import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/widgets.dart';

class MainVerifyOtpScreen extends StatefulWidget {
  const MainVerifyOtpScreen({Key? key}) : super(key: key);

  @override
  _MainVerifyOtpScreenState createState() => _MainVerifyOtpScreenState();
}

class _MainVerifyOtpScreenState extends State<MainVerifyOtpScreen>
    with TickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var autoValidate = false;
  String verificationCode = '';
  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController = StreamController();
  AnimationController? _controller;
  int levelClock = 120;

  @override
  void dispose() {
    errorController.close();
    if (_controller != null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock));
    _controller?.forward();

    super.initState();
  }

  processOTp() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(RouteConstants.success);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Verify Email',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: Color(0xFF76706A),
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * .9,
                              child:  RichText(
                                text: TextSpan(
                                  text:
                                  'Please enter the 6-digit verification code that was sent to ',
                                  style: TextStyle(
                                    color: AppColors.descText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'abc@gmail.com.',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Get.toNamed(RouteConstants.login);
                                          },
                                        style: const TextStyle(
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColors.primary),
                                  color: AppColors.primary.withOpacity(.05)
                                ),
                                width: size.width,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Can’t see the email? Check Spam folder \nWrong email address?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),

                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      'Please re-enter your email address',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppColors.primary
                                      ),

                                    ),

                                  ],
                                ),
                              ),
                            ),
                            
                            const SizedBox(
                              height: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: PinCodeTextField(
                                    appContext: context,
                                    pastedTextStyle: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    length: 6,
                                    obscureText: false,
                                    obscuringCharacter: '*',
                                    animationType: AnimationType.fade,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(10),
                                      fieldHeight: 45,
                                      fieldWidth: 40,
                                      borderWidth: 0.7,
                                      selectedColor:
                                          AppColors.appGrey.withOpacity(.7),
                                      inactiveColor:
                                          AppColors.appGrey.withOpacity(.7),
                                      disabledColor: Colors.white,
                                      selectedFillColor: Colors.white,
                                      inactiveFillColor: Colors.white,
                                      activeColor: AppColors.appGrey,
                                      activeFillColor: Colors.white,
                                    ),
                                    cursorColor: AppColors.primary,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        height: 1.6,
                                        color: AppColors.primary),
                                    backgroundColor: Colors.white,
                                    enableActiveFill: true,
                                    errorAnimationController: errorController,
                                    controller: textEditingController,
                                    keyboardType: TextInputType.number,
                                    // boxShadows: [
                                    //   BoxShadow(
                                    //     offset: const Offset(0, 1),
                                    //     color: Colors.grey.shade100,
                                    //     blurRadius: 10,
                                    //   )
                                    // ],
                                    onCompleted: (pin) {
                                      verificationCode = pin;
                                      processOTp();
                                    },
                                    onChanged: (pin) {
                                      setState(() {
                                        verificationCode = pin;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .05,
                                ),


                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xFFF4F4F6),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.timer),
                                          Countdown(
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              animation: StepTween(
                                                begin: levelClock,
                                                end: 0,
                                              ).animate(_controller!)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text:
                                        'Didn\'t get code? ',
                                        style: TextStyle(
                                          color: Theme
                                              .of(context)
                                              .hintColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Resend',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Get.toNamed(RouteConstants.login);
                                                },
                                              style: const TextStyle(
                                                  color: AppColors.primary)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: size.height * .4,
                                  child: Visibility(
                                    visible: isLoading,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            AppColors.primary),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
