import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return context.heightPercentage(.22);
    } else if (context.height <= 783) {
      return context.heightPercentage(.27);
    } else if (context.height <= 812) {
      return context.heightPercentage(.29);
    } else if (context.height <= 844) {
      return context.heightPercentage(.30);
    } else {
      // Default case for heights greater than 844
      return context.heightPercentage(.35);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.height * .05,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Login to',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              LogoWithTextWidget(
                                fontSize: 27,
                                logoWidth: 21,
                              )
                            ],
                          ),
                          SizedBox(
                            height: context.heightPercentage(.03),
                          ),
                          const Text(
                            'Enter your Email and Password to login to \nCapp',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: context.heightPercentage(.015),
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Email',
                            inputFieldWidget: CappCustomFormField(
                              hintText: 'abc@gmail.com',
                              // onSavedValue: (value) => usernameOrEmail = value,
                              onChanged: (val) {
                                setState(() {});
                              },
                              keyboardType: TextInputType.emailAddress,

                              isValidated: emailController.text.isNotEmpty &&
                                  emailController.text.isValidEmail,
                              inputFormatter: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"\s\b|\b\s"))
                              ],
                              validator: (value) =>
                                  value!.isNotEmpty && value.isValidEmail
                                      ? null
                                      : 'Please enter valid email',
                              controller: emailController,
                            ),
                          ),
                          SizedBox(
                            height: context.heightPercentage(.005),
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Password',
                            inputFieldWidget: CappCustomFormField(
                              hintText: '********',
                              onChanged: (val) {
                                setState(() {});
                              },
                              inputFormatter: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"\s\b|\b\s"))
                              ],
                              isTextObscure: _passwordVisible,
                              isValidated: passwordController.text.length > 6,
                              suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      _passwordVisible
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: 20,
                                    ),
                                  )),
                              validator: (value) => value!.length > 6
                                  ? null
                                  : 'Password must be more than 6 chars',
                              controller: passwordController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: calculateMainAxisExtent(context.height)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: true,
                              onPress: () {
                                Get.toNamed(RouteConstants.home);
                              },
                              color: AppColors.primary,
                              isSolidColor: true,
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  // : Colors.white.withOpacity(.7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Sign Up',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(RouteConstants.signup);
                                          },
                                        style: const TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteConstants.forgotPassword);
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
