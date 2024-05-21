
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capp/core/utils/util.dart';
import 'package:capp/core/utils/validators.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/widgets.dart';

class MainCheckOutScreen extends StatefulWidget {

  const MainCheckOutScreen({
        super.key,
      });

  @override
  _MainCheckOutScreenState createState() => _MainCheckOutScreenState();
}

class _MainCheckOutScreenState extends State<MainCheckOutScreen> {
  String? addressForService = '21 Fujah, Surulere, Lagos NG';
  TextEditingController couponController = TextEditingController();

  void showEditPackageModal({required String title, required Function onSelected, required int index}) {
    CustomDialogWidgets.buildEditPackageDialog(
        context: context,
        onItemClicked: (val) {
          onSelected(val);
        },
        hideBottomBtn: true,
        itemSelected: index,
        onQuantityChanged: (val){

        },
        size: MediaQuery.of(context).size,
        list: ['Bedrooms','Bathrooms', 'Kitchen', 'Living Room'],
        title: title, selectedItems: {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child)
    {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 52568695

                BackArrowWidget(onTap: () {
                  Get.back();
                },),
                const SizedBox(height: 3),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Summary',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24
                    ),),
                ),
                const SizedBox(height: 20,),

                CheckoutItemWidget(onEditServicePressed: () {
                  showEditPackageModal(title: 'Take Down Hairstyle',
                      onSelected: (val) {

                      },
                      index: 0
                  );
                }),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Enter Promo Code',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      CappCustomFormField(
                        hintText: 'Promo Code',
                        // onSavedValue: (value) => usernameOrEmail = value,
                        onChanged:  (val) {
                        },
                        keyboardType: TextInputType.text,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.code,
                            size: 15,
                          ),
                        ),
                        isValidated: couponController.text.isNotEmpty,
                        inputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r"\s\b|\b\s")
                          )],
                        validator: (value) =>
                        value!.isNotEmpty && value.isValidPhone()
                            ? null
                            : 'Please enter valid fields',
                        controller: couponController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(
                        text:
                        'Service will be provided between ',
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .hintColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:'${Util.getDateTimePlusDuration(DateTime.now(), TimeOfDay.now(), const Duration(minutes: 10))} - '
                                  '${Util.getDateTimePlusDuration(DateTime.now(), TimeOfDay.now(), const Duration(minutes: 35))}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
                          const TextSpan(
                            text:' on ',),
                          TextSpan(
                            text:Util.convertDateFromServerToUI6(DateTime.now().add(const Duration(days: 5))),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: themeProvider.isDarkMode ? Colors.white : Colors.black),),
                          const TextSpan(
                            text:' at ',),
                          TextSpan(
                              text:'$addressForService',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: themeProvider.isDarkMode ? Colors.white : Colors.black)),

                        ],
                      ),
                    ),
                  ),
                ) ,


                const SizedBox(height: 40),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Divider(
                    height: 0.6,
                    color: Colors.grey.withOpacity(.6),
                                   ),
                 ),
                const SizedBox(height: 20),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Summary',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),),
                      const SizedBox(height: 10,),

                      const PaymentSummaryItemWidget(
                        title: 'Service Total',
                        amount: '50000',
                      ),
                      const PaymentSummaryItemWidget(
                        title: 'Service Fee',
                        amount: '4000',
                      ),

                      const SizedBox(height: 30),
                      Divider(
                        height: 0.6,
                        color: Colors.grey.withOpacity(.6),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: CappCustomButton(
                      isActive: true,
                      onPress: () {

                      },
                      color: Theme
                          .of(context)
                          .highlightColor,
                      isSolidColor: true,
                      paddingVertical: 15,
                      borderRadius: 24,
                      child: const Text(
                        'Proceed To Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}




