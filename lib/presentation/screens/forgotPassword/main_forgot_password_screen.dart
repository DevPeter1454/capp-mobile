
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capp/core/utils/validators.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';

class MainForgotPasswordScreen extends StatefulWidget {
  const MainForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<MainForgotPasswordScreen> createState() => _MainForgotPasswordScreenState();
}

class _MainForgotPasswordScreenState extends State<MainForgotPasswordScreen> {
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

                          Padding(
                            padding: const EdgeInsets.only(top: 30),
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
                          const SizedBox(height: 40,),
                          const Text('Please enter the email address you used in registering on Capp.',
                            style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400,
                            ),),
                          const SizedBox(height: 25,),

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
                        ],
                      ),

                      SizedBox(height: size.height * .45,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: true,
                              onPress: () {
                                Get.toNamed(RouteConstants.setNewPass);
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
