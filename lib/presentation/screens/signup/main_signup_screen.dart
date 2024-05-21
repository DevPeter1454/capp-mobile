
import 'package:capp/providers/theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/core/utils/validators.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class MainSignUpScreen extends StatefulWidget {
  const MainSignUpScreen({Key? key}) : super(key: key);

  @override
  State<MainSignUpScreen> createState() => _MainSignUpScreenState();
}

class _MainSignUpScreenState extends State<MainSignUpScreen> {
  var formKey =  GlobalKey<FormState>();
  var scaffoldKey =  GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
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
                          SizedBox(height: size.height * .05,),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Welcome to',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),),
                              SizedBox(width: 5,),
                              LogoWithTextWidget(
                                fontSize: 27,
                                logoWidth: 21,
                              )
                            ],
                          ),
                          const SizedBox(height: 30,),
                          const Text('Enter your Email and Password to start your registration',
                            style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 15,),

                          InputFieldColumnWidget(
                            inputFieldTitle: 'Email',
                            inputFieldWidget: CappCustomFormField(
                              hintText: 'abc@gmail.com',
                              // onSavedValue: (value) => usernameOrEmail = value,
                              onChanged: (val) {
                                // setState(() {
                                //   // usernameOrEmail = val;
                                // });
                              },
                              keyboardType: TextInputType.emailAddress,

                              isValidated: emailController.text.isNotEmpty &&
                                  emailController.text.isValidEmail(),
                              inputFormatter: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"\s\b|\b\s")
                                )
                              ],
                              validator: (value) =>
                              value!.isNotEmpty && value.isValidEmail()
                                  ? null
                                  : 'Please enter valid fields',
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
                                // setState(() {
                                //   // password = val;
                                // });
                              },
                              inputFormatter: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r"\s\b|\b\s")
                                )
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
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 20,
                                    ),
                                  )),
                              validator: (value) =>
                              value!.length > 6
                                  ? null
                                  : 'Password must be more than 6 chars',
                              controller: passwordController,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * .25,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: true,
                              onPress: () {
                                Get.toNamed(RouteConstants.signup2);
                              },
                              color: AppColors.primary,
                              isSolidColor: true,
                              child: Text(
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
                          SizedBox(height: 25,),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .hintColor,
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

          )
      );
    });
  }
}
