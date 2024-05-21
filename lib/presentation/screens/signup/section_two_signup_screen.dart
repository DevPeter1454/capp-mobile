
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

class SectionTwoSignUpScreen extends StatefulWidget {
  const SectionTwoSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SectionTwoSignUpScreen> createState() => _SectionTwoSignUpScreenState();
}

class _SectionTwoSignUpScreenState extends State<SectionTwoSignUpScreen> {
  var formKey =  GlobalKey<FormState>();
  var scaffoldKey =  GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  List<String> states = ['Lagos', 'Oyo'];
  List<String> lgas = ['Surulere', 'Lagos Mainland'];
  String? selectedState, selectedLGA;


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


                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text:
                              'Just a ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'little ',
                                    style: const TextStyle(
                                        color: AppColors.primary)),
                                TextSpan(
                                    text: 'more',),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Text('Please continue with the last part of your registerarion',
                            style: TextStyle(
                                fontSize: 14,fontWeight: FontWeight.w400
                            ),),
                          const SizedBox(height: 15,),

                          InputFieldColumnWidget(
                            inputFieldTitle: 'First name',
                            inputFieldWidget: CappCustomFormField(
                              hintText: 'Enter first name',
                              // onSavedValue: (value) => usernameOrEmail = value,
                              onChanged: (val) {
                              },
                              keyboardType: TextInputType.text,

                              isValidated: firstnameController.text.isNotEmpty,
                              validator: (value) =>
                              value!.isNotEmpty
                                  ? null
                                  : 'Please enter valid fields',
                              controller: firstnameController,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Surname',
                            inputFieldWidget: CappCustomFormField(
                              hintText: 'Enter surname',
                              // onSavedValue: (value) => usernameOrEmail = value,
                              onChanged: (val) {
                              },
                              keyboardType: TextInputType.text,

                              isValidated: lastnameController.text.isNotEmpty,
                              validator: (value) =>
                              value!.isNotEmpty
                                  ? null
                                  : 'Please enter valid fields',
                              controller: lastnameController,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Phone',
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
                              isValidated: phoneController.text.length > 6,
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
                              controller: phoneController,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'State',
                            inputFieldWidget:  CappCustomDropDown(
                              selectedItem: selectedState,
                              dropDownList: states,
                              isValidated: selectedState != null,
                              hintText: 'Select State',
                              onValueChanged: (value) {
                                setState(() {
                                  selectedState = value.toString();
                                });
                              },
                              width: size.width,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InputFieldColumnWidget(
                            inputFieldTitle: 'Local Government Area',
                            inputFieldWidget:  CappCustomDropDown(
                              selectedItem: selectedLGA,
                              dropDownList: lgas,
                              isValidated: selectedLGA != null,
                              hintText: 'Select Local Government Area',
                              onValueChanged: (value) {
                                setState(() {
                                  selectedLGA = value.toString();
                                });
                              },
                              width: size.width,
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: true,
                              onPress: () {
                                Get.toNamed(RouteConstants.otpVerify);
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
