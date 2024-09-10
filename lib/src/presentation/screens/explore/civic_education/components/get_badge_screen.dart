import 'dart:io';

import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class GetBadgeScreen extends StatefulWidget {
  const GetBadgeScreen({super.key});

  @override
  State<GetBadgeScreen> createState() => _GetBadgeScreenState();
}

class _GetBadgeScreenState extends State<GetBadgeScreen> {
  exitDialog(BuildContext context) {
    CustomDialogWidgets.buildOperationStatusDialog(
        title: 'Please proceed to the dashboard',
        desc: '',
        onPositiveBtnTap: () => Get.offNamed(RouteConstants.home),
        positiveBtnTitle: 'Yes',
        negativeBtnTitle: 'No',
        onNegativeBtnTap: () {});
  }

  final _userProfileCubit = getIt.get<UserProfileCubit>();

  Uint8List? _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  Future<void> shareImage(Uint8List imageBytes) async {
    // Get the temporary directory of the device
    final tempDir = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = await File('${tempDir.path}/image.png').create();

    // Write the Uint8List to the file as bytes
    file.writeAsBytesSync(imageBytes);

    print("File Path: ${file.path}");
    print("real file : ${XFile(file.path)}");

    // Share the image file using Share Plus
    await Share.shareXFiles([XFile(file.path)],
        text: 'I got this badge by completing a quiz on CAPP');
  }

  @override
  void initState() {
    super.initState();
    _userProfileCubit.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exitDialog(context),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 85, 15, 0),
              child: ListView(
                physics: context.height < 730
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                      height: 299,
                      width: 294,
                      decoration: BoxDecoration(
                          color: AppColors.inputHint.withOpacity(.4),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.asset('assets/images/badge.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 9.0),
                            child: Container(
                              height: 40,
                              width: context.widthPercentage(0.46),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: context.widthPercentage(.3),
                                    child: Text(
                                      "${UserConstant.firstName} ${UserConstant.lastName}",
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  // const Expanded(
                                  //   child: SizedBox(
                                  //     width: 5,
                                  //   ),
                                  // ),
                                  Image.asset(
                                    'assets/images/tick-circle.png',
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  GestureDetector(
                    onTap: () {
                      // showModalBottomSheet(
                      //   context: context,
                      //   useSafeArea: true,
                      //   shape: const RoundedRectangleBorder(
                      //     borderRadius:
                      //         BorderRadius.vertical(top: Radius.circular(20)),
                      //   ),
                      //   builder: (context) {
                      //     return const CappCustomBottomSheet();
                      //   },
                      // );
                      screenshotController.capture().then((Uint8List? image) {
                        if (image != null) {
                          setState(() {
                            _imageFile = image;
                          });
                          print("Capture Success ${_imageFile!.length}");
                        } else {
                          print("Capture failed: Image is null");
                        }
                      }).catchError((onError) {
                        print(onError);
                      });
                      shareImage(_imageFile!);
                    },
                    child: Container(
                      height: 50,
                      width: 175.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Share Badge',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/images/send_green.png',
                            height: 24,
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.heightPercentage(.27),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CappCustomButton(
                      onPress: () => Get.offNamed(RouteConstants.home),
                      isSolidColor: true,
                      isActive: true,
                      color: AppColors.primary,
                      child: const Text('Go to Dashboard',
                          style: TextStyle(
                            color: Colors.white,
                            // : Colors.white.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
