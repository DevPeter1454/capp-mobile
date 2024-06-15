import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCard extends StatelessWidget {
  final String? title,
      acroymn,
      officeHolderName,
      politicalPartyImageUrl,
      mdaImageUrl;
  final bool isKnowMDA;
  final bool isIconLeft;
  final double ctnheight, ctnWidth;
  final Function()? onClickedPrimaryActionButton;
  const CustomListCard(
      {super.key,
      required this.title,
      this.acroymn,
      this.officeHolderName,
      this.politicalPartyImageUrl,
      required this.isKnowMDA,
      this.isIconLeft = true,
      this.onClickedPrimaryActionButton,
      this.mdaImageUrl,
      this.ctnheight = 120,
      this.ctnWidth = 120});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isKnowMDA
            ? CircleAvatar(
                radius: 42,
                backgroundColor: AppColors.primaryLight,
                backgroundImage: AssetImage(mdaImageUrl!),
              )
            : Container(
                height: ctnheight,
                width: ctnWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(politicalPartyImageUrl!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(8)),
              ),
        SizedBox(
          width: context.widthPercentage(.015),
        ),
        SizedBox(
          width: context.widthPercentage(.386),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 215,
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                acroymn ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.descText),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 17,
                child: officeHolderName.isNull
                    ? const SizedBox.shrink()
                    : Text(
                        isKnowMDA ? 'Minister' : 'Office',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: AppColors.descText),
                      ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                height: 17,
                width: 215,
                child: Text(
                  officeHolderName ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColors.descText),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: onClickedPrimaryActionButton,
            child: SizedBox(
              width: 30,
              height: 30,
              child: isIconLeft
                  ? Image.asset(
                      'assets/images/arrow-left.png',
                    )
                  : Image.asset(
                      'assets/images/arrow-down.png',
                    ),
            ),
          ),
        )
      ],
    );
  }
}
