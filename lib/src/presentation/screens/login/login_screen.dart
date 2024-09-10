import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/login/cubit/login_cubit.dart';
import 'package:capp/src/presentation/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:capp/src/presentation/screens/privacy_policy/terms_of_use.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  final _loginCubit = getIt.get<LoginCubit>();

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return context.heightPercentage(.21);
    } else if (context.height <= 783) {
      return context.heightPercentage(.26);
    } else if (context.height <= 812) {
      return context.heightPercentage(.26);
    } else if (context.height <= 844) {
      return context.heightPercentage(.30);
    } else {
      // Default case for heights greater than 844
      return context.heightPercentage(.31);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: BlocConsumer<LoginCubit, LoginState>(
          bloc: _loginCubit,
          listener: (context, state) {
            state.maybeWhen(
                loginSuccessful: () {
                  context.hideLoadingDialog();

                  Get.offNamed(RouteConstants.home);
                },
                loading: () => context.showLoadingDialog(),
                error: (message) {
                  context.hideLoadingDialog();
                  context.showSnackBar(message);
                },
                orElse: () {});
          },
          builder: (context, state) {
            return SafeArea(
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
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
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
                                isValidated:
                                    passwordController.text.isValidPassword,
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
                                validator: (value) => value!.isValidPassword
                                    ? null
                                    : 'Password must be more than 6 chars long, including small\nand capital letters,numbers and special characters',
                                controller: passwordController,
                              ),
                            ),
                          ],
                        ),
                        Text(
                            "NB: CAPP is a civic initiative and is not a representation of any government entity or agency.",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: context.heightPercentage(.25),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: CappCustomButton(
                                isActive: emailController.text.isValidEmail &&
                                    passwordController.text.isValidPassword,
                                onPress: () async {
                                  _loginCubit.login(
                                      email: emailController.text
                                          .trim()
                                          .toLowerCase(),
                                      password: passwordController.text.trim());
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
                                              Get.toNamed(
                                                  RouteConstants.signup);
                                            },
                                          style: const TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Center(
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
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => const PrivacyPolicyScreen());
                                },
                                child: const Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => const TermsOfUse());
                                },
                                child: const Text(
                                  'Terms of Service',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
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
            );
          },
        ));
  }
}
