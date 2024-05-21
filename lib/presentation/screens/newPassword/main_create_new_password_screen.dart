
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capp/core/utils/validators.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';

class MainCreateNewPasswordScreen extends StatefulWidget {
  const MainCreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<MainCreateNewPasswordScreen> createState() => _MainCreateNewPasswordScreenState();
}

class _MainCreateNewPasswordScreenState extends State<MainCreateNewPasswordScreen> {
  var formKey =  GlobalKey<FormState>();
  var scaffoldKey =  GlobalKey<ScaffoldState>();
  bool _passwordVisible = true, _confirmPasswordVisible = true;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

                          Padding(
                            padding: const EdgeInsets.only(top: 25),
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
                                  'Create Password',
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
                          const SizedBox(height: 30,),
                          const Text('Please enter a new password that you can easily remember for login.',
                            style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 15,),
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

                          const SizedBox(
                            height: 5,
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Re-enter Password',
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

                              isTextObscure: _confirmPasswordVisible,
                              isValidated: confirmPasswordController.text.length > 6,
                              suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _confirmPasswordVisible = !_confirmPasswordVisible;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(
                                      _confirmPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      size: 20,
                                    ),
                                  )),
                              validator: (value) =>
                              value == passwordController.text
                                  ? null
                                  : 'Password must be more than 6 chars',
                              controller: confirmPasswordController,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * .35,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: true,
                              onPress: () {
                                Get.toNamed(RouteConstants.success);
                              },
                              color: AppColors.primary,
                              isSolidColor: true,
                              child: Text(
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
