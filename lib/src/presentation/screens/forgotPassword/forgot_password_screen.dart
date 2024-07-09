import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();

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
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Password Reset',
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
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Please enter the email address you used in registering on Capp.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Email',
                          inputFieldWidget: CappCustomFormField(
                            hintText: 'abc@gmail.com',
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
                                    : 'Please enter a valid email',
                            controller: emailController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .51,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CappCustomButton(
                            isActive: emailController.text.isValidEmail,
                            onPress: () {
                              Get.toNamed(RouteConstants.createNewPassword);
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
