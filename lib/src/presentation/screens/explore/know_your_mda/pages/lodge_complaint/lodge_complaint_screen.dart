import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/domain/model/complaint.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/pages/lodge_complaint/cubit/lodge_a_complaint_cubit.dart';
import 'package:capp/src/presentation/screens/signup/user_signup_detail_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LodgeComplaintScreen extends StatefulWidget {
  final String mdaId;
  const LodgeComplaintScreen({super.key, required this.mdaId});

  @override
  State<LodgeComplaintScreen> createState() => _LodgeComplaintScreenState();
}

class _LodgeComplaintScreenState extends State<LodgeComplaintScreen> {
  final _lastnameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  final _complaintController = TextEditingController();

  List<String> genders = ['Male', 'Female'];
  String? selectedGender;

  List<CountryCode> countryCode = [
    CountryCode('+234', 'assets/images/ngn.png')
  ];

  final _lodgeAcomplaintCubit = getIt.get<LodgeAComplaintCubit>();

  Future<void> lodgeComplaint() async {
    await _lodgeAcomplaintCubit.lodgeComplaint(Complaint(
        createdAt: "",
        id: "",
        mdaId: widget.mdaId,
        firstName: _firstnameController.text,
        lastName: _lastnameController.text,
        complain: _complaintController.text,
        email: _emailController.text,
        gender: selectedGender!,
        phone: _phoneController.text,
        age: _ageController.text));
  }

  CountryCode? selectedCountryCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LodgeAComplaintCubit, LodgeAComplaintState>(
        bloc: _lodgeAcomplaintCubit,
        listener: (context, state) {
          state.maybeWhen(
              loaded: (complaint) {
                context.hideLoadingDialog();
                if (complaint.firstName.isNotEmpty) {
                  Get.offNamedUntil(
                      RouteConstants.success,
                      arguments: Arguments(
                        RouteConstants.lodgeAComplaintScreen,
                        () => Get.offNamedUntil(
                          RouteConstants.knowyourMDA,
                          ModalRoute.withName('/home'),
                        ),
                      ),
                      ModalRoute.withName('/home'));
                } else {
                  Get.snackbar(
                    'Error',
                    'Failed to donate to party',
                    backgroundColor: Colors.red,
                  );
                }
              },
              error: (message) {
                context.hideLoadingDialog();
                Get.snackbar("Error", message);
              },
              loading: () {
                context.showLoadingDialog();
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
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomTopNavBar(title: "Lodge a Complaint"),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          'Please fill the details below to lodge your  complaint and to enable us follow up your  experience for an efficient public  service delivery. Sections marked with * are required.',
                          style: TextStyle(
                            color: AppColors.descText,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
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
                            isValidated: _firstnameController.text.isNotEmpty,
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : 'Please enter required  field',
                            controller: _firstnameController,
                          ),
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Other names',
                          showAsterisk: true,
                          inputFieldWidget: CappCustomFormField(
                            hintText: 'Enter your other names',
                            onChanged: (val) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.text,
                            isValidated: _lastnameController.text.isNotEmpty,
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : 'Please enter required  field',
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
                            containerBgColor: AppColors.appGrey.withOpacity(.3),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CappCustomDropDown(
                                selectedItem: selectedCountryCode,
                                dropDownList: countryCode,
                                isValidated: selectedCountryCode != null,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
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
                                        borderRadius: BorderRadius.circular(8),
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
                                  fillColor: AppColors.appGrey.withOpacity(.3),
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
                          inputFieldTitle: 'Register Complaint',
                          showAsterisk: true,
                          inputFieldWidget: CappCustomFormField(
                            hintText: 'Enter your complaint',
                            onChanged: (val) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.number,
                            maxLines: 5,
                            isNotBorder: true,
                            fillColor: AppColors.appGrey.withOpacity(.3),
                            isValidated: _complaintController.text.isNotEmpty,
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : 'Please enter required field',
                            controller: _complaintController,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CappCustomButton(
                          onPress: () async {
                            lodgeComplaint();
                          },
                          isSolidColor: true,
                          isActive: _firstnameController.text.isNotEmpty &&
                              _emailController.text.isValidEmail &&
                              _lastnameController.text.isNotEmpty &&
                              _complaintController.text.isNotEmpty &&
                              _phoneController.text.isNotEmpty &&
                              _ageController.text.isNotEmpty &&
                              selectedGender != null &&
                              selectedCountryCode != null,
                          color: AppColors.primary,
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => const Text("Something went wrong"));
        },
      ),
    );
  }
}
