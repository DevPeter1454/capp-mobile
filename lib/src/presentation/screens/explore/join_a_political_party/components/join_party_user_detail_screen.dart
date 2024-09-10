import 'dart:io';

import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/cubit/political_party_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/pages/options.dart';
import 'package:capp/src/presentation/screens/signup/user_signup_detail_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class JoinPartyUserSignUpScreen extends StatefulWidget {
  final String id;
  const JoinPartyUserSignUpScreen({super.key, required this.id});

  @override
  State<JoinPartyUserSignUpScreen> createState() =>
      _JoinPartyUserSignUpScreenState();
}

class _JoinPartyUserSignUpScreenState extends State<JoinPartyUserSignUpScreen> {
  final _lastnameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();
  final _ninController = TextEditingController();
  final _electoralController = TextEditingController();
  final _pollingController = TextEditingController();
  List<String> genders = ['Male', 'Female'];
  List<String> countryOfResidence = ["Nigeria"];
  // List<String> states = ['Lagos', 'Oyo'];

  List<String> lgas = ['Surulere', 'Lagos Mainland'];
  List<String> pollingUnit = ['Unit 1', 'Unit 2'];
  List<String> electoralWard = ['Ward 1', 'Ward 2'];
  List<CountryCode> countryCode = [
    CountryCode('+234', 'assets/images/ngn.png')
  ];
  List options = statesAndLgas;
  List states = statesAndLgas.map((e) => e["label"]).toList();
  List lgasList = [];

  void setLgaList(String state) {
    lgasList.clear();

    setState(() {
      selectedLGA = "Select LGA";
      // lgasList = options
      //     .firstWhere((state) => state['value'] == state)['lgas']
      //     .cast<String>();
      lgasList = statesAndLgas
          .where((e) => e["label"] == state)
          .map((e) => e["lgas"])
          .toList();
      lgasList[0].insert(0, "Select LGA");
    });
    print("lgasList $lgasList");
  }

  String? selectedState,
      selectedLGA,
      selectedGender,
      selectedPollingUnit,
      selectedWard,
      selectedCountryOfResidence;
  CountryCode? selectedCountryCode;

  final _politicalPartyCubit = getIt.get<PoliticalPartyCubit>();

  Future<void> joinAPoliticalParty(
      {required String id,
      required int age,
      required String occupation}) async {
    final response = await _politicalPartyCubit.joinAPoliticalParty(
        id: widget.id,
        age: age,
        occupation: occupation,
        firstName: _firstnameController.text,
        lastName: _lastnameController.text,
        gender: selectedGender!,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        countryOfResidence: selectedCountryOfResidence!,
        stateOfResidence: selectedState!,
        lga: selectedLGA!,
        electoralWard: selectedWard!,
        pollingUnit: selectedPollingUnit!,
        nin: _ninController.text);
    print("response from screen $response");
  }

  File? _image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<PoliticalPartyCubit, PoliticalPartyState>(
          bloc: _politicalPartyCubit,
          listener: (context, state) {
            state.maybeWhen(
                joined: (joined) {
                  if (joined.id.isNotEmpty) {
                    Get.offNamedUntil(
                        RouteConstants.success,
                        arguments: Arguments(
                          RouteConstants.joinPartyUserSignUpScreen,
                          () => Get.offNamedUntil(
                            RouteConstants.joinParty,
                            ModalRoute.withName('/home'),
                          ),
                        ),
                        ModalRoute.withName('/home'));
                  } else {
                    Get.snackbar(
                      'Error',
                      'Failed to join party',
                      backgroundColor: Colors.red,
                    );
                  }
                },
                orElse: () {});
          },
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(
                      child:
                          SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                    ),
                initial: () {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: [
                            const CustomTopNavBar(title: "Join Party"),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Please fill the details below to become a registered member of this party. Filed marked with an * are required',
                              style: TextStyle(
                                color: AppColors.descText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'First Name',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter first name',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isNotBorder: true,
                                isValidated:
                                    _firstnameController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required  field',
                                controller: _firstnameController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              showAsterisk: true,
                              inputFieldTitle: 'Surname',
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter surname',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isValidated:
                                    _lastnameController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _lastnameController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Gender',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedGender,
                                dropDownList: genders,
                                hasBorderLine: false,
                                containerBgColor:
                                    AppColors.appGrey.withOpacity(.3),
                                isValidated: selectedGender != null,
                                hintText: 'Select Gender',
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedGender = value.toString();
                                  });
                                },
                                width: context.width,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Email',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'abc@gmail.com',
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isValidated: _emailController.text.isValidEmail,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter valid email',
                                controller: _emailController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              showAsterisk: true,
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
                                      isNotBorder: true,
                                      fillColor:
                                          AppColors.appGrey.withOpacity(.3),
                                      onChanged: (val) {
                                        setState(() {});
                                      },
                                      keyboardType: TextInputType.phone,
                                      inputFormatter: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r"\s\b|\b\s"))
                                      ],
                                      isValidated:
                                          _phoneController.text.isValidPhone,
                                      validator: (value) => value!.isNotEmpty
                                          ? null
                                          : 'Please enter required field',
                                      controller: _phoneController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Age',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter your age',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isValidated: _ageController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _ageController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Occupation',
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter your occupation',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isValidated:
                                    _occupationController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _occupationController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Country Of Origin',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedCountryOfResidence,
                                dropDownList: countryOfResidence,
                                isValidated: selectedCountryOfResidence != null,
                                hintText: 'Select Country',
                                hasBorderLine: false,
                                containerBgColor:
                                    AppColors.appGrey.withOpacity(.3),
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedCountryOfResidence =
                                        value.toString();
                                  });
                                },
                                width: context.width,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'State Of Residence',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedState,
                                dropDownList: statesAndLgas
                                    .map((e) => e["label"])
                                    .toList(),
                                hasBorderLine: false,
                                containerBgColor:
                                    AppColors.appGrey.withOpacity(.3),
                                isValidated: selectedState != null,
                                hintText: 'Select State',
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedState = value.toString();
                                  });
                                  setLgaList(value.toString());
                                },
                                width: context.width,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'LGA',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomDropDown(
                                selectedItem: selectedLGA,
                                dropDownList: lgasList.isEmpty
                                    ? ["Select LGA"]
                                    : lgasList[0],
                                hasBorderLine: false,
                                containerBgColor:
                                    AppColors.appGrey.withOpacity(.3),
                                isValidated: selectedLGA != null,
                                hintText: 'Select Local Government Area',
                                onValueChanged: (value) {
                                  setState(() {
                                    selectedLGA = value.toString();
                                  });
                                },
                                width: context.width,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Electoral Ward',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter your electoral ward',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isNotBorder: true,
                                isValidated:
                                    _electoralController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _electoralController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Polling Unit',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter your polling unit',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isNotBorder: true,
                                isValidated: _pollingController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _pollingController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'NIN',
                              showAsterisk: true,
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter your NIN',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isNotBorder: true,
                                isValidated: _ninController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty
                                    ? null
                                    : 'Please enter required field',
                                controller: _ninController,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: _image != null
                                  ? Image.file(
                                      _image!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    )
                                  : InputFieldColumnWidget(
                                      inputFieldTitle: 'Upload Passport ID',
                                      inputFieldWidget: Container(
                                        height: 150,
                                        width: 380,
                                        decoration: BoxDecoration(
                                            color: AppColors.appGrey
                                                .withOpacity(.3),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 28,
                                              left: 125,
                                              child: Text(
                                                'Tap Icon to upload ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.appGrey
                                                      .withOpacity(.9),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 25,
                                                left: 155,
                                                child: SizedBox(
                                                  height: 60,
                                                  width: 60,
                                                  child: Image.asset(
                                                    'assets/images/ic_image.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CappCustomButton(
                                onPress: () async {
                                  await joinAPoliticalParty(
                                      id: widget.id,
                                      age: int.parse(_ageController.text),
                                      occupation:
                                          _occupationController.text.trim());
                                },
                                isSolidColor: true,
                                isActive:
                                    _firstnameController.text.isNotEmpty &&
                                        _emailController.text.isValidEmail &&
                                        _lastnameController.text.isNotEmpty &&
                                        _ninController.text.isNotEmpty &&
                                        _phoneController.text.isNotEmpty &&
                                        _ageController.text.isNotEmpty &&
                                        selectedGender != null &&
                                        selectedCountryCode != null &&
                                        selectedCountryOfResidence != null &&
                                        selectedLGA != null &&
                                        _pollingController.text.isNotEmpty &&
                                        selectedState != null &&
                                        _electoralController.text.isNotEmpty,
                                color: AppColors.primary,
                                child: const Text(
                                  'Join Party',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                orElse: () => const Text("Something went wrong"));
          },
        ));
  }
}
