import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/presentation/screens/signup/cubit/sign_up_cubit.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class UserSignUpDetailScreen extends StatefulWidget {
  final String email, password;
  const UserSignUpDetailScreen(
      {Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<UserSignUpDetailScreen> createState() => _UserSignUpDetailScreenState();
}

class _UserSignUpDetailScreenState extends State<UserSignUpDetailScreen> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  List<String> states = ['Lagos', 'Oyo'];
  List<String> lgas = ['Surulere', 'Lagos Mainland'];
  List<CountryCode> countryCode = [
    CountryCode('+234', 'assets/images/ngn.png')
  ];
  String? selectedState, selectedLGA;
  CountryCode? selectedCountryCode;

  final _signUpCubit = getIt.get<SignUpCubit>();

  @override
  void initState() {
    selectedCountryCode = countryCode[0];
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: BlocConsumer<SignUpCubit, SignUpState>(
          bloc: _signUpCubit,
          listener: (context, state) {
            state.maybeWhen(
                signUpSuccessful: () {
                  context.hideLoadingDialog();
                  Get.offNamedUntil(
                      RouteConstants.success,
                      arguments: Arguments(
                        RouteConstants.login,
                        () => Get.offNamedUntil(
                          RouteConstants.login,
                          ModalRoute.withName('/signup'),
                        ),
                      ),
                      ModalRoute.withName('/signup'));
                },
                error: (message) {
                  context.hideLoadingDialog();
                  context.showSnackBar(message);
                },
                loading: () {
                  context.showLoadingDialog();
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
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                text: 'Just a ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'little ',
                                      style:
                                          TextStyle(color: AppColors.primary)),
                                  TextSpan(
                                    text: 'more',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Please continue with the last part of your registration',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'First name',
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter first name',
                                // onSavedValue: (value) => usernameOrEmail = value,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,

                                isValidated:
                                    firstnameController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
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
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isValidated: lastnameController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
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
                                inputFieldWidget: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CappCustomDropDown(
                                      selectedItem: selectedCountryCode,
                                      dropDownList: countryCode,
                                      isValidated: selectedCountryCode != null,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      hintText: 'Select',
                                      onValueChanged: (value) {
                                        setState(() {
                                          selectedCountryCode = value;
                                        });
                                      },
                                      valueWidget: (value) {
                                        final name = value.name;
                                        return Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: SizedBox(
                                                height: 24,
                                                width: 24,
                                                child: Image.asset(value.url),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              name,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        );
                                      },
                                      width: context.width * .3,
                                    ),
                                    SizedBox(
                                      width: context.width * .57,
                                      child: CappCustomFormField(
                                        hintText: 'Enter Phone Number',
                                        // onSavedValue: (value) => password = value,
                                        onChanged: (val) {
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.phone,
                                        inputFormatter: [
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r"\s\b|\b\s"))
                                        ],

                                        isValidated:
                                            phoneController.text.isNotEmpty,

                                        controller: phoneController,
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'State',
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedState,
                                dropDownList: states,
                                isValidated: selectedState != null,
                                hintText: 'Select State',
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedState = value.toString();
                                  });
                                },
                                width: context.width,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Local Government Area',
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedLGA,
                                dropDownList: lgas,
                                isValidated: selectedLGA != null,
                                hintText: 'Select Local Government Area',
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedLGA = value.toString();
                                  });
                                },
                                width: context.width,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: CappCustomButton(
                                isActive:
                                    firstnameController.text.isValidName &&
                                        lastnameController.text.isValidName &&
                                        phoneController.text.isValidPhone &&
                                        !selectedLGA.isNull &&
                                        !selectedState.isNull,
                                onPress: () {
                                  _signUpCubit.signUpUser(
                                      firstname:
                                          firstnameController.text.trim(),
                                      surname: lastnameController.text.trim(),
                                      phone: phoneController.text.trim(),
                                      password: widget.password,
                                      state: selectedState!,
                                      lga: selectedLGA!,
                                      email: widget.email);
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
            );
          },
        ));
  }
}

class CountryCode {
  final String? name;
  final String? url;

  CountryCode(this.name, this.url);
}
