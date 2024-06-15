import 'package:auto_size_text/auto_size_text.dart';
import 'package:capp/main.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'custom_uis.dart';

class CustomDialogWidgets {
  CustomDialogWidgets._();

  static buildEditPackageDialog({
    required BuildContext context,
    required ValueChanged onItemClicked,
    dynamic itemSelected,
    required List list,
    required String title,
    required Size size,
    bool hideBottomBtn = false,
    required Map<String, int> selectedItems,
    required ValueChanged<Map<String, int>> onQuantityChanged,
    Function()? onButtonPressed,
  }) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (ctxt) {
          return Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
            return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: Container(
                                      child: Text(
                                        title ?? 'Select Network',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 20,
                                          color: themeProvider.isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 0.5,
                              color: Colors.grey.withOpacity(.35),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Column(
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: list.asMap().entries.map((e) {
                            //         return AddMoreChoreWidget(
                            //           onQuantityUpdated: (val) {
                            //             onQuantityChanged({e.value: val});
                            //           },
                            //           selectedItems: selectedItems,
                            //           title: e.value,
                            //         );
                            //       }).toList(),
                            //     ),
                            //     const SizedBox(
                            //       height: 30,
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: size.height * .15,
                            ),
                          ],
                        ),
                      ),
                    ),
                    !hideBottomBtn
                        ? Positioned(
                            bottom: 0,
                            child: Container(
                              width: size.width,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 25, 20, 10),
                              color: themeProvider.isDarkMode
                                  ? Colors.grey[900]
                                  : Colors.white,
                              child: SafeArea(
                                top: false,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '\$230.00',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    CappCustomButton(
                                      isActive: true,
                                      onPress: onButtonPressed,
                                      color: Colors.deepPurpleAccent,
                                      isSolidColor: true,
                                      width: size.width * .4,
                                      paddingVertical: 14,
                                      borderRadius: 10,
                                      child: const Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        : const SizedBox()
                  ],
                ));
          });
        });
  }

  static buildSelectItemDialog(
      {required BuildContext context,
      required ValueChanged onItemClicked,
      dynamic itemSelected,
      required List list,
      required String title}) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (ctxt) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
                              child: Center(
                                child: Text(
                                  title ?? 'Select Network',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Theme.of(context).hintColor.withOpacity(.35),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: list
                              .asMap()
                              .entries
                              .map((e) => InkWell(
                                    onTap: () {
                                      onItemClicked(e.key);
                                      Navigator.of(ctxt).pop();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 13),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                e.value,
                                                maxLines: 1,
                                                minFontSize: 14,
                                                maxFontSize: 18,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Icon(
                                                itemSelected == e.key
                                                    ? Icons.check_circle
                                                    : Icons.circle,
                                                color: itemSelected == e.key
                                                    ? AppColors.primary
                                                    : Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: Colors.grey.withOpacity(.5),
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Center(
                        //   child: RoundedButton(
                        //       text: 'Submit',
                        //       press: () {
                        //         Navigator.of(ctxt).pop();
                        //         setNetwork(selectedNetworkIndex);
                        //       }),
                        // ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ));
        });
  }

  static buildSelectOptionAlertDialog(
      {required BuildContext context,
      required ValueChanged onItemClicked,
      dynamic itemSelected,
      required List list,
      required String title,
      Function()? onBtnTap,
      String? btnTitle,
      Icon? onBtnIcon}) {
    String selectedItem = itemSelected;
    showDialog(
        context: context,
        barrierDismissible: false,
        // isDismissible: false,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        // ),
        builder: (ctxt) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5.0,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Center(
                        child: Text(
                          title ?? 'Select Network',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: list
                              .asMap()
                              .entries
                              .map((e) => InkWell(
                                    onTap: () {
                                      onItemClicked(e.key);
                                      setModalState(() {
                                        selectedItem = e.value;
                                      });
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Radio(
                                          value: e.value,
                                          groupValue: selectedItem,
                                          onChanged: (selectedLanguage) {
                                            setModalState(() {
                                              selectedItem = selectedLanguage;
                                            });
                                            onItemClicked(e.key);
                                          },
                                          activeColor: AppColors.primary,
                                        ),
                                        Text(
                                          e.value,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    // child: ListTile(
                                    //   title: Text(e.value, style: const TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w400
                                    //   ),),
                                    //   contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                                    //   minVerticalPadding: 1,
                                    //   leading: Radio(
                                    //     value: e.value,
                                    //     groupValue: selectedItem,
                                    //     onChanged: (selectedLanguage) {
                                    //       setModalState(() {
                                    //         selectedItem = selectedLanguage;
                                    //       });
                                    //     },
                                    //   ),
                                    // ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: CappCustomButton(
                          isActive: true,
                          onPress: () {
                            onBtnTap!();
                            Navigator.of(ctxt).pop();
                          },
                          color: AppColors.primary,
                          isSolidColor: true,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                btnTitle ?? 'Continue',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              onBtnIcon ?? Container(),
                            ],
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  static buildOperationStatusDialogWithEmojiIcon(
      {Color? iconBgColor,
      required String title,
      required String desc,
      String? emoji,
      required Function onPositiveBtnTap,
      Function? onNegativeBtnTap,
      Function? onExtraBtnTap,
      required String positiveBtnTitle,
      String? extraBtnTitle,
      String? negativeBtnTitle,
      bool? closeWidget,
      ValueChanged? showAgainFunc,
      String? moreText,
      Widget? onPositiveBtnIcon}) {
    bool showOnNextStartup = false;
    closeWidget = closeWidget ?? true;
    showModalBottomSheet(
        context: Get.context!,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (ctxt) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    iconBgColor ?? Colors.red.withOpacity(.1),
                              ),
                              padding: const EdgeInsets.all(25),
                              child: Text(
                                emoji ?? "😁",
                                style: const TextStyle(fontSize: 55),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              desc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: CappCustomButton(
                            isActive: true,
                            onPress: () {
                              if (closeWidget ?? false) {
                                Navigator.of(ctxt).pop();
                              }
                              onPositiveBtnTap();
                            },
                            color: AppColors.primary,
                            isSolidColor: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  positiveBtnTitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                onPositiveBtnIcon ?? Container(),
                              ],
                            ),
                          )),
                          onExtraBtnTap != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                        child: CappCustomButton(
                                      isActive: true,
                                      onPress: () {
                                        if (closeWidget ?? false) {
                                          Navigator.of(ctxt).pop();
                                        }
                                        onExtraBtnTap();
                                      },
                                      color: Colors.transparent,
                                      hasBorder: true,
                                      borderColor: Colors.red,
                                      isSolidColor: true,
                                      child: Text(
                                        extraBtnTitle ?? '',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              : const SizedBox(),
                          onNegativeBtnTap != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(ctxt).pop();
                                            onNegativeBtnTap();
                                          },
                                          child: Text(
                                            negativeBtnTitle ?? '',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline),
                                          )),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          showAgainFunc != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: showOnNextStartup,
                                            onChanged: (val) {
                                              setModalState(() {
                                                showOnNextStartup =
                                                    !showOnNextStartup;
                                              });
                                              showAgainFunc(showOnNextStartup);
                                            },
                                            activeColor: Theme.of(context)
                                                .highlightColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            moreText ?? 'Don’t show this again',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  static buildOperationStatusDialog(
      {TextAlign? descTextAlign,
      required String title,
      required String desc,
      required Function onPositiveBtnTap,
      Function? onNegativeBtnTap,
      Function? onExtraBtnTap,
      required String positiveBtnTitle,
      String? extraBtnTitle,
      String? negativeBtnTitle,
      bool? closeWidget,
      ValueChanged? showAgainFunc,
      String? moreText,
      Widget? onPositiveBtnIcon}) {
    bool showOnNextStartup = false;
    closeWidget = closeWidget ?? true;
    showModalBottomSheet(
        context: Get.context!,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (ctxt) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: LogoWithTextWidget(
                                  fontSize: 27,
                                  logoWidth: 21,
                                  titleColor: AppColors.primaryDark,
                                )),
                            Container(
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              desc,
                              textAlign: descTextAlign ?? TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context).hintColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: CappCustomButton(
                            isActive: true,
                            onPress: () {
                              if (closeWidget ?? false) {
                                Navigator.of(ctxt).pop();
                              }
                              onPositiveBtnTap();
                            },
                            color: AppColors.primary,
                            isSolidColor: true,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  positiveBtnTitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                onPositiveBtnIcon ?? Container(),
                              ],
                            ),
                          )),
                          onExtraBtnTap != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                        child: CappCustomButton(
                                      isActive: true,
                                      onPress: () {
                                        if (closeWidget ?? false) {
                                          Navigator.of(ctxt).pop();
                                        }
                                        onExtraBtnTap();
                                      },
                                      color: Colors.transparent,
                                      hasBorder: true,
                                      borderColor: Colors.red,
                                      isSolidColor: true,
                                      child: Text(
                                        extraBtnTitle ?? '',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                )
                              : const SizedBox(),
                          onNegativeBtnTap != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(ctxt).pop();
                                            onNegativeBtnTap();
                                          },
                                          child: Text(
                                            negativeBtnTitle ?? '',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                decoration:
                                                    TextDecoration.underline),
                                          )),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          showAgainFunc != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            value: showOnNextStartup,
                                            onChanged: (val) {
                                              setModalState(() {
                                                showOnNextStartup =
                                                    !showOnNextStartup;
                                              });
                                              showAgainFunc(showOnNextStartup);
                                            },
                                            activeColor: Theme.of(context)
                                                .highlightColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            moreText ?? 'Don’t show this again',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  static buildErrorSnackbar(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  static buildSuccessSnackbar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  static copyText(
    String text,
    String infoText,
  ) {
    Clipboard.setData(ClipboardData(
      // text: userData.referralCode
      text: text,
    )).then((_) {
      scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("$infoText has been copied to clipboard",
              style: const TextStyle(color: Colors.white)),
        ),
      );
    });
  }
}
