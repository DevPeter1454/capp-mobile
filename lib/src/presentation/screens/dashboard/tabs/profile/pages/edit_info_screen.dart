import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/userdata.dart';
import 'package:capp/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart';
import 'package:capp/src/presentation/screens/signup/user_signup_detail_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditProfileInfo extends StatefulWidget {
  final UserData userData;
  const EditProfileInfo({super.key, required this.userData});

  @override
  State<EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneController = TextEditingController();
  List<String> states = ['Lagos', 'Oyo'];
  List<String> lgas = ['Surulere', 'Lagos Mainland'];
  List<CountryCode> countryCode = [CountryCode('+234', 'assets/images/ngn.png')];
  String? selectedState, selectedLGA;
  CountryCode? selectedCountryCode;

  final _profileCubit = getIt.get<UserProfileCubit>();

  var updatedData = {
    "firstname": "",
    "surname": "",
    "phone": "",
    "state": "",
    "lga": "",
  };

  @override
  void initState() {
    super.initState();
    firstnameController.text = widget.userData.firstname;
    lastnameController.text = widget.userData.surname;
    phoneController.text = widget.userData.phone;
    selectedState = widget.userData.state;
    selectedCountryCode = countryCode[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileState>(
      bloc: _profileCubit,
      listener: (context, state) {
        state.maybeWhen(
            loading: () {
              context.showLoadingDialog();
            },
            error: (message) {
              context.hideLoadingDialog();
              context.showSnackBar(message);
            },
            updateSuccessful: () {
              context.hideLoadingDialog();
              Get.to(() => const DashboardScreen());
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTopNavBar(title: "Edit Information"),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Please continue with the last part of your registration',
                style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.w400, color: const Color(0XFF6C727F)),
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

                  isValidated: firstnameController.text.isNotEmpty,
                  validator: (value) => value!.isNotEmpty ? null : 'Please enter valid fields',
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
                  validator: (value) => value!.isNotEmpty ? null : 'Please enter valid fields',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CappCustomDropDown(
                        selectedItem: selectedCountryCode,
                        dropDownList: countryCode,
                        isValidated: selectedCountryCode != null,
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
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
                          inputFormatter: [FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))],

                          isValidated: phoneController.text.isNotEmpty,

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
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CappCustomButton(
                      isActive: firstnameController.text.isValidName &&
                          lastnameController.text.isValidName &&
                          phoneController.text.isValidPhone &&
                          !(selectedLGA == null) &&
                          !(selectedState == null),
                      onPress: () {
                        updatedData["firstname"] = firstnameController.text.trim();
                        updatedData["surname"] = lastnameController.text.trim();
                        updatedData["phone"] = phoneController.text.trim();
                        updatedData["state"] = selectedState!;
                        updatedData["lga  "] = selectedLGA!;
                        _profileCubit.editUserInfo(userData: updatedData);
                        // _signUpCubit.signUpUser(
                        //     firstname: firstnameController.text.trim(),
                        //     surname: lastnameController.text.trim(),
                        //     phone: phoneController.text.trim(),
                        //     password: widget.password,
                        //     state: selectedState!,
                        //     lga: selectedLGA!,
                        //     email: widget.email);
                      },
                      color: AppColors.primary,
                      isSolidColor: true,
                      child: const Text(
                        'Save Changes',
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
        ))));
      },
    );
  }
}
