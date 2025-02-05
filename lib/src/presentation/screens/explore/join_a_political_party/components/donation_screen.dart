import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/argument.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/cubit/political_party_cubit.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class DonationScreen extends StatefulWidget {
  final String id;
  const DonationScreen({super.key, required this.id});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _amountController = TextEditingController();
  final _cardController = TextEditingController();
  final _cvvController = TextEditingController();

  get calculateSizeBoxExtent {
    if (context.height <= 667) {
      return context.heightPercentage(.15);
    } else if (context.height <= 746) {
      return context.heightPercentage(.2);
    } else if (context.height <= 896) {
      return context.heightPercentage(.64);
    } else {
      // Default case for heights greater than 844
      return context.heightPercentage(.91);
    }
  }

  final _politicalPartyCubit = getIt.get<PoliticalPartyCubit>();

  Future<void> donateToParty({required String id, required int amount}) async {
    final response = await _politicalPartyCubit.donateToParty(
      id: widget.id,
      amount: amount,
    );
    print("response from screen $response");
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
                        RouteConstants.donationScreen,
                        () => Get.offNamedUntil(
                          RouteConstants.joinParty,
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
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              initial: () {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const CustomTopNavBar(title: "Donate"),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              'Please enter amount and fill in your cards details to donate to this party',
                              style: TextStyle(
                                color: AppColors.descText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Enter Amount',
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'Enter amount',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                isValidated: _amountController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty ? null : 'Please enter required  field',
                                controller: _amountController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Enter Card Number',
                              inputFieldWidget: CappCustomFormField(
                                hintText: '00000 00000 00000',
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                isValidated: _cardController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty ? null : 'Please enter required field',
                                controller: _cardController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'Expiry Date',
                              inputFieldWidget: CappCustomFormField(
                                hintText: 'MM/YYY',
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isValidated: _cvvController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty ? null : 'Please enter valid email',
                                controller: _cvvController,
                              ),
                            ),
                            InputFieldColumnWidget(
                              inputFieldTitle: 'CVV',
                              inputFieldWidget: CappCustomFormField(
                                hintText: '000',
                                isNotBorder: true,
                                fillColor: AppColors.appGrey.withOpacity(.3),
                                onChanged: (val) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.text,
                                isValidated: _cvvController.text.isNotEmpty,
                                validator: (value) => value!.isNotEmpty ? null : 'Please enter valid email',
                                controller: _cvvController,
                              ),
                            ),
                            SizedBox(
                              height: context.heightPercentage(.2),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: CappCustomButton(
                                  onPress: () async {
                                    await donateToParty(id: widget.id, amount: int.parse(_amountController.text));
                                  },
                                  isSolidColor: true,
                                  isActive: _amountController.text.isNotEmpty && _cardController.text.isNotEmpty && _cvvController.text.isNotEmpty,
                                  color: AppColors.primary,
                                  child: const Text(
                                    'Donate',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
