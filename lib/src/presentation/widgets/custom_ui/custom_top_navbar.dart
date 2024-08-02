import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTopNavBar extends StatelessWidget {
  final String title;
  final String? primaryActionButton;
  final String? secondaryActionButton;
  final double spacing;
  final Function()? onClickedPrimaryActionButton;
  final Function()? onClickedSecondaryActionButton;
  const CustomTopNavBar({
    super.key,
    required this.title,
    this.primaryActionButton,
    this.secondaryActionButton,
    this.onClickedPrimaryActionButton,
    this.onClickedSecondaryActionButton,
    this.spacing = .3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),
          primaryActionButton.isNull
              ? const SizedBox.shrink()
              : SizedBox(
                  width: context.width > 375 ? context.widthPercentage(spacing) : context.widthPercentage(.2),
                ),
          Expanded(
            child: Row(
              children: [
                GestureDetector(
                  onTap: onClickedPrimaryActionButton,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: primaryActionButton.isNull ? const SizedBox.shrink() : Image.asset(primaryActionButton!),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: onClickedSecondaryActionButton,
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: secondaryActionButton.isNull ? const SizedBox.shrink() : Image.asset(secondaryActionButton!),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
