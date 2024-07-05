import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/forgotPassword/create_new_password_screen.dart';
import 'package:capp/src/presentation/screens/forgotPassword/cubit/reset_password_cubit.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
  final _resetPasswordCubit = getIt.get<ResetPasswordCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        bloc: _resetPasswordCubit,
        listener: (context, state) {
          state.maybeWhen(
              confirmEmailSuccessfully: () {
                context.hideLoadingDialog();
                Get.to(() => const CreateNewPasswordScreen());
              },
              loading: () => context.showLoadingDialog(),
              error: (message) {
                context.hideLoadingDialog();
                context.showSnackBar(message);
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
                        height: context.height * .51,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CappCustomButton(
                              isActive: emailController.text.isValidEmail,
                              onPress: () {
                                _resetPasswordCubit.confirmEmail(
                                    email: emailController.text.trim());
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
      ),
    );
  }
}
