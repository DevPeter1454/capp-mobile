import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:capp/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreatePollScreen extends StatefulWidget {
  const CreatePollScreen({super.key});

  @override
  State<CreatePollScreen> createState() => _CreatePollScreenState();
}

class _CreatePollScreenState extends State<CreatePollScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final firstOptionContoller = TextEditingController();
  final secondOptionController = TextEditingController();
  double calculateSpace(double height) {
    if (context.height <= 667) {
      return context.heightPercentage(.12);
    } else if (context.height <= 746) {
      return context.heightPercentage(.19);
    } else if (context.height <= 844) {
      return context.heightPercentage(.36);
    } else {
      // Default case for heights greater than 844
      return context.heightPercentage(.38);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        const CustomTopNavBar(title: 'Create  Poll'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Cull feedback and opinions from citizens to take collective action and advocate for change',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.descText),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Questions',
                          inputFieldWidget: CappCustomFormField(
                            hintText: 'Enter Question',
                            onChanged: (val) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.text,
                            isValidated: firstOptionContoller.text.isNotEmpty,
                            inputFormatter: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            validator: (value) =>
                                value!.isNotEmpty && value.isValidEmail
                                    ? null
                                    : 'Please field cannot be empty',
                            controller: firstOptionContoller,
                          ),
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Option 1',
                          inputFieldWidget: CappCustomFormField(
                            hintText: 'Enter Option 1',
                            fillColor: AppColors.appGrey.withOpacity(.3),
                            isNotBorder: true,
                            onChanged: (val) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.text,
                            isValidated: firstOptionContoller.text.isNotEmpty,
                            inputFormatter: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : 'Please field cannot be empty',
                            controller: firstOptionContoller,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InputFieldColumnWidget(
                          inputFieldTitle: 'Option 2',
                          inputFieldWidget: CappCustomFormField(
                            fillColor: AppColors.appGrey.withOpacity(.3),
                            isNotBorder: true,
                            hintText: 'Enter Option 2',
                            onChanged: (val) {
                              setState(() {});
                            },
                            inputFormatter: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r"\s\b|\b\s"))
                            ],
                            isValidated: firstOptionContoller.text.isNotEmpty,
                            validator: (value) => value!.isNotEmpty
                                ? null
                                : 'Please field cannot be empty',
                            controller: secondOptionController,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.primary,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text('Add')
                          ],
                        ),
                        Container(
                            // color: Colors.brown,
                            height: calculateSpace(context.height)),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: context.heightPercentage(.03)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CappCustomButton(
                                  onPress: () {},
                                  color: AppColors.primary,
                                  isSolidColor: true,
                                  width: context.width * .4,
                                  paddingVertical: 12,
                                  isActive: true,
                                  child: const Text(
                                    'Publish',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(
                                width: context.widthPercentage(.022),
                              ),
                              CappCustomButton(
                                onPress: () {
                                  showModalBottomSheet(
                                    context: context,
                                    useSafeArea: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (context) {
                                      return const CappCustomBottomSheet();
                                    },
                                  );
                                },
                                color: AppColors.primary.withOpacity(.1),
                                isSolidColor: true,
                                width: context.width * .4,
                                paddingVertical: 12,
                                isActive: true,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Share Poll',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset('assets/images/send_green.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
