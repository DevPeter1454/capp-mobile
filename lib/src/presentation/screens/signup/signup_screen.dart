import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                          height: size.height * .05,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            LogoWithTextWidget(
                              fontSize: 27,
                              logoWidth: 21,
                              titleColor: AppColors.primaryDark,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Enter your Email and Password to start your registration',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
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
                        const SizedBox(
                          height: 5,
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Password',
                          inputFieldWidget: CappCustomFormField(
                            hintText: '********',
                            // onSavedValue: (value) => password = value,
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
                    SizedBox(
                      height: size.height * .25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CappCustomButton(
                            isActive: emailController.text.isValidEmail &&
                                passwordController.text.isValidPassword,
                            onPress: () {
                              Get.toNamed(RouteConstants.userDetails);
                            },
                            color: AppColors.primary,
                            isSolidColor: true,
                            child: const Text(
                              'Proceed',
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Login',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(RouteConstants.login);
                                        },
                                      style: const TextStyle(
                                          color: AppColors.primary)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
