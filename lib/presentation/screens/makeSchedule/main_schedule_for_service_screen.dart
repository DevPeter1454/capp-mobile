
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/core/utils/util.dart';
import 'package:capp/core/utils/validators.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class MainScheduleForServiceScreen extends StatefulWidget {

  const MainScheduleForServiceScreen({
        super.key,
      });

  @override
  _MainScheduleForServiceScreenState createState() => _MainScheduleForServiceScreenState();
}

class _MainScheduleForServiceScreenState extends State<MainScheduleForServiceScreen> {
  int successfulBookings = 0;
  int serviceTimeCounter = 0;
  DateTime? selectedStartDate;
  TimeOfDay? selectedStartTime;
  String beforeDate = '';
  bool isStartBehind = false;
  String? addressForService = '21 Fujah, Surulere, Lagos NG';
  TextEditingController phoneController = TextEditingController();

  void _showReviews(BuildContext context) {
    // Show reviews screen
  }


  void selectDate(DateTime? selectedDate) async{
    selectedDate ??= selectedStartDate==null ? DateTime.now() : selectedStartDate!;
    print('Year ${DateTime.now().year}');
    final currentYear = DateTime.now().year;
    final startYear = selectedStartDate==null ? DateTime.now() : selectedStartDate!;
    final endYear = currentYear + 5;
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: startYear,
      lastDate: DateTime(endYear),
      helpText: "SELECT DATE",
      cancelText: "CANCEL",
      confirmText: "SELECT",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: const Color(0xFF03AC27),
            buttonTheme: const ButtonThemeData(),
            // colorScheme: ColorScheme.light(primary: const Color(0xFF03AC27)).copyWith(secondary: const Color(0xFF03AC27)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
          selectedStartDate = picked;
          checkTimeFrame();
      });
    }
  }

  void selectTime(TimeOfDay? selectedTime) async{
    try{
      selectedTime = selectedTime?? TimeOfDay.now();
      TimeOfDay? pickedTime =  await showTimePicker(
        initialTime: selectedTime,
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              primaryColor: const Color(0xFF03AC27),
              buttonTheme: const ButtonThemeData(),
              // colorScheme: ColorScheme.light(primary: const Color(0xFF03AC27)).copyWith(secondary: const Color(0xFF03AC27)),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null && pickedTime != selectedTime) {
        setState(() {
            selectedStartTime = pickedTime;
            checkTimeFrame();
        });
      }else{
        print("Time is not selected");
      }
    }catch(e){
      print(e.toString());
    }
  }


  void showEditPackageModal({required String title, required Function onSelected, required int index}) {
    CustomDialogWidgets.buildEditPackageDialog(
        context: context,
        onItemClicked: (val) {
          onSelected(val);
        },
        itemSelected: index,
        onQuantityChanged: (val){

        },
        size: MediaQuery.of(context).size,
        list: ['Bedrooms','Bathrooms', 'Kitchen', 'Living Room'],
        title: title, selectedItems: {});
  }


  void checkTimeFrame(){
    try{
      final today = DateTime.now();
      var startTime = today;
      if(selectedStartDate!=null && selectedStartTime!=null){
        startTime = DateTime(selectedStartDate!.year, selectedStartDate!.month, selectedStartDate!.day,
            selectedStartTime!.hour, selectedStartTime!.minute);
      }
        isStartBehind = (selectedStartDate==null || selectedStartTime==null) ? false : startTime.isBefore(today);

      }catch(e){
        isStartBehind = true;
    }
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
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Book Appointment For Service',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22
                    ),),
                ),
                const SizedBox(height: 20,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Material(
                    shadowColor:!themeProvider.isDarkMode
                        ?  Colors.grey.withOpacity(.15) : Colors.transparent,
                    color:!themeProvider.isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withOpacity(.05),
                    borderRadius:  BorderRadius.all(const Radius.circular(10)),

                    elevation: 6,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Take Down Hairstyle',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.amber,size: 15,),
                                SizedBox(width: 4,),
                                Text('4.3 (12.3K Reviews)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),),

                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Stating at \$20.00',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 3),
                                child: Icon(Icons.circle, color: Colors.black,size: 5,),
                              ),
                              Text('1 hrs 30mins',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // const Divider(
                //   height: 1,
                //   color: Colors.grey,
                // ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Select Date',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,),
                              ),
                              const SizedBox(height: 10,),
                              GestureDetector(
                                onTap: (){
                                  selectDate(selectedStartDate);
                                },
                                child: ProJobCustomInputContainerWidget(
                                  isActive: selectedStartDate != null,
                                  hint: 'DD/MM/YYYY',
                                  width: size.width * .45,
                                  isValidated: selectedStartDate != null && !isStartBehind,
                                  suffixFlex: 2,
                                  prefixFlex: 8,
                                  hasError: isStartBehind,
                                  errorText: '',
                                  height: 60,
                                  startFlex: 2,
                                  startWidget: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.date_range_outlined,
                                      size: 15,
                                      color:  Theme.of(context).hintColor.withOpacity(.9),
                                    ),
                                  ),
                                  mainText: Util.convertDateFromServerToUI5(
                                      selectedStartDate ?? DateTime.now()),
                                  suffixWidget: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color:  Theme.of(context).hintColor.withOpacity(.9),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Select Time',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,),
                              ),
                              const SizedBox(height: 10,),
                              GestureDetector(
                                onTap: (){
                                  selectTime(selectedStartTime);
                                },
                                child: ProJobCustomInputContainerWidget(
                                  isActive: selectedStartTime != null,
                                  hint: 'hh:mm',
                                  width: size.width * .40,
                                  suffixFlex: 2,
                                  prefixFlex: 8,
                                  startFlex: 2,
                                  startWidget:  Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 15,
                                    color:  Theme.of(context).hintColor.withOpacity(.9),
                                  ),
                                ),
                                  hasError: isStartBehind,
                                  errorText: '',
                                  isValidated: selectedStartTime != null && !isStartBehind,
                                  height: 60,
                                  mainText:selectedStartTime!=null ? selectedStartTime!.format(context): TimeOfDay.now().format(context),
                                  suffixWidget: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color:  Theme.of(context).hintColor.withOpacity(.9),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Visibility(
                          visible: isStartBehind,
                          child: const Text(
                            'Date and Time cannot be behind the current date/time',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Confirm Address For Service',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                        },
                        child: ProJobCustomInputContainerWidget(
                          isActive: addressForService != null,
                          hint: 'Service Address ',
                          width: size.width,
                          isValidated: addressForService != null,
                          suffixFlex: 3,
                          prefixFlex: 7,
                          startFlex: 1,
                          hasError: false,
                          errorText: '',
                          height: 60,
                          mainText: addressForService,
                          startWidget:  Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.location_pin,
                              size: 15,
                              color:  Theme.of(context).hintColor.withOpacity(.9),
                            ),
                          ),
                          suffixWidget: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ProJobMiniButtonWidget(
                              onBtnTapped: (){},
                              btnTitle: 'Change',
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Enter Contact Number',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,),
                      ),
                      const SizedBox(height: 10,),
                      CappCustomFormField(
                        hintText: 'Phone Number',
                        // onSavedValue: (value) => usernameOrEmail = value,
                        onChanged:  (val) {
                        },
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.phone_android,
                            size: 15,
                          ),
                        ),
                        isValidated: phoneController.text.isNotEmpty && phoneController.text.isValidPhone(),
                        inputFormatter: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r"\s\b|\b\s")
                          )],
                        validator: (value) =>
                        value!.isNotEmpty && value.isValidPhone()
                            ? null
                            : 'Please enter valid fields',
                        controller: phoneController,
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 40),
                 Divider(
                  height: 0.6,
                  color: Colors.grey.withOpacity(.6),
                ),
                const SizedBox(height: 20),

                selectedStartDate!=null && selectedStartTime!=null ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      text: TextSpan(
                        text:
                        'Be ready to receive service provider between ',
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .hintColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:'${Util.getDateTimePlusDuration(selectedStartDate!, selectedStartTime!, const Duration(minutes: 10))} - '
                                  '${Util.getDateTimePlusDuration(selectedStartDate!, selectedStartTime!, const Duration(minutes: 35))}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
                          TextSpan(
                            text:' on ',),
                          TextSpan(
                              text:'${Util.convertDateFromServerToUI6(selectedStartDate!)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: themeProvider.isDarkMode ? Colors.white : Colors.black),)
                        ],
                      ),
                    ),
                  ),
                ) : SizedBox(),

                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: CappCustomButton(
                      isActive: true,
                      onPress: () {
                        Get.toNamed(RouteConstants.checkOut);
                      },
                      color: Theme
                          .of(context)
                          .highlightColor,
                      isSolidColor: true,
                      paddingVertical: 15,
                      borderRadius: 24,
                      child: Text(
                        'Proceed To Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          // : Colors.white.withOpacity(.7),
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

