import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/domain/repository/user_repository.dart';
import 'package:capp/src/presentation/screens/capp_success_screen.dart';
import 'package:capp/src/presentation/screens/forgotPassword/cubit/reset_password_cubit.dart';
import 'package:capp/src/presentation/screens/login/login_screen.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/app_lifecycle.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final bool isForgotPassword;
  const CreateNewPasswordScreen({Key? key, this.isForgotPassword = true})
      : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisible = true, _confirmPasswordVisible = true;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _resetPasswordCubit = getIt.get<ResetPasswordCubit>();
  final _userRepository = getIt.get<UserRepository>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    final sharedPrefs = getIt.get<SharedPreferencesService>();
    final appLifecycleService = AppLifecycleService(sharedPrefs,
        isForgotPassword: widget.isForgotPassword);
    appLifecycleService.startObserving();
    super.initState();
  }

  @override
  void dispose() {
    // appLifecycleService.stopObserving();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<bool> exitDialog(BuildContext context) async {
    if (widget.isForgotPassword) {
      CustomDialogWidgets.buildOperationStatusDialog(
          title: 'Do You Wish to Quit the Process',
          desc: 'Going back takes you to the login screen ',
          onPositiveBtnTap: () async {
            await _userRepository.logOut();
            Get.offNamedUntil(
                RouteConstants.login, ModalRoute.withName('/login'));
          },
          positiveBtnTitle: 'Yes',
          negativeBtnTitle: 'No',
          onNegativeBtnTap: () {});
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
          key: scaffoldKey,
          body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            bloc: _resetPasswordCubit,
            listener: (context, state) {
              state.maybeWhen(
                  resetPasswordSuccessfully: () {
                    if (widget.isForgotPassword) {
                      context.hideLoadingDialog();
                      Get.to(
                        CappSuccessScreen(
                          arguments: Arguments(
                            RouteConstants.changePassword,
                            () => Get.offAll(
                              () => const LoginScreen(),
                            ),
                          ),
                        ),
                      );
                    } else {
                      context.hideLoadingDialog();
                      Get.back();
                      context.showSnackBar(
                          'Password has been changed successfully');
                    }
                  },
                  loading: () {
                    return context.showLoadingDialog();
                  },
                  error: (message) async {
                    if (widget.isForgotPassword) {
                      await _userRepository.logOut();
                      context.hideLoadingDialog();
                      context.showSnackBar(message);
                    } else {
                      context.hideLoadingDialog();
                      context.showSnackBar(message);
                    }
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
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.isForgotPassword
                                        ? const SizedBox.shrink()
                                        : InkWell(
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
                                    Text(
                                      widget.isForgotPassword
                                          ? 'Forgot Password'
                                          : 'Create New Password',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          // color: Color(0xFF76706A),
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Please enter a new password that you can easily remember for login.',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              InputFieldColumnWidget(
                                inputFieldTitle: widget.isForgotPassword
                                    ? 'New Password'
                                    : 'Old Password',
                                inputFieldWidget: CappCustomFormField(
                                  hintText: '********',
                                  // onSavedValue: (value) => password = value,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  inputFormatter: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r"\s\b|\b\s"))
                                  ],

                                  isTextObscure: _passwordVisible,
                                  isValidated:
                                      passwordController.text.isValidEmail,
                                  suffix: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Icon(
                                          _passwordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          size: 20,
                                        ),
                                      )),
                                  validator: (value) => value!.isValidEmail
                                      ? null
                                      : 'Password must be more than 6 chars long, including small\nand capital letters,numbers and special characters',

                                  controller: passwordController,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              InputFieldColumnWidget(
                                inputFieldTitle: widget.isForgotPassword
                                    ? 'Re-enter New Password'
                                    : 'New Password',
                                inputFieldWidget: CappCustomFormField(
                                  hintText: '********',
                                  // onSavedValue: (value) => password = value,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  inputFormatter: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r"\s\b|\b\s"))
                                  ],

                                  isTextObscure: _confirmPasswordVisible,
                                  isValidated:
                                      confirmPasswordController.text.length > 6,
                                  suffix: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _confirmPasswordVisible =
                                              !_confirmPasswordVisible;
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Icon(
                                          _confirmPasswordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          size: 20,
                                        ),
                                      )),
                                  validator: (value) => widget.isForgotPassword
                                      ? value == passwordController.text
                                          ? null
                                          : 'Password does not match'
                                      : value!.isValidPassword
                                          ? null
                                          : 'Password must be more than 6 chars long, including small\nand capital letters,numbers and special characters',
                                  controller: confirmPasswordController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * .35,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: CappCustomButton(
                                  isActive: widget.isForgotPassword
                                      ? passwordController
                                              .text.isValidPassword ==
                                          confirmPasswordController
                                              .text.isValidPassword
                                      : passwordController
                                              .text.isValidPassword &&
                                          confirmPasswordController
                                              .text.isValidPassword,
                                  onPress: () {
                                    _resetPasswordCubit.resetPassword(
                                        oldPassword:
                                            passwordController.text.trim(),
                                        newPassword: confirmPasswordController
                                            .text
                                            .trim());
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
          )),
    );
  }
}
