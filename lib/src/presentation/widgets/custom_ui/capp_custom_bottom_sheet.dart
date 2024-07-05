import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_video_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/continue_reading.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CappCustomBottomSheet extends StatefulWidget {
  final bool isShareIcon;
  final int? countPartyLeader;
  final Function()? onClickedPrimaryActionButton;
  final Function()? onClickedSecondaryActionButton;
  final Function()? onClickedContinueReading;
  final String? title,
      politicalPartyName,
      acrocymn,
      politicalPartyLogo,
      namePartyLeader,
      partyDetails,
      partyLeaderImageUrl;
  const CappCustomBottomSheet(
      {super.key,
      this.isShareIcon = true,
      this.title,
      this.politicalPartyName,
      this.acrocymn,
      this.onClickedPrimaryActionButton,
      this.onClickedSecondaryActionButton,
      this.politicalPartyLogo,
      this.partyLeaderImageUrl,
      this.countPartyLeader,
      this.namePartyLeader,
      this.onClickedContinueReading,
      this.partyDetails});

  @override
  State<CappCustomBottomSheet> createState() => _CappCustomBottomSheetState();
}

class _CappCustomBottomSheetState extends State<CappCustomBottomSheet> {
  get calculateMaxLines {
    if (context.height <= 667) {
      return 10;
    } else if (context.height <= 746) {
      return 12;
    } else if (context.height <= 896) {
      return 15;
    } else {
      // Default case for heights greater than 844
      return 18;
    }
  }

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight - 205;
    } else if (context.height <= 746) {
      return availableHeight - 152;
    } else if (context.height <= 896) {
      return availableHeight - 88;
    } else if (context.height <= 915) {
      return availableHeight - 17;
    } else {
      // Default case for heights greater than 844
      return availableHeight;
    }
  }

  get calculateListViewExtent {
    if (context.height <= 667) {
      return context.heightPercentage(.58);
    } else if (context.height <= 746) {
      return context.heightPercentage(.54);
    } else if (context.height <= 896) {
      return context.heightPercentage(.47);
    } else {
      // Default case for heights greater than 844
      return context.heightPercentage(.42);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isShareIcon
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: context.heightPercentage(.02),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Share PDF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.descText,
                          child: Icon(
                            Icons.close_rounded,
                            size: 12,
                          )),
                    ),
                  ],
                ),
                Divider(
                    color: Theme.of(context).hintColor.withOpacity(.6),
                    thickness: 0.2),
                SizedBox(height: widget.isShareIcon ? 20 : 12),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  mainAxisSpacing: 31,
                  crossAxisSpacing: 0,
                  children: [
                    ShareIconButton(
                      icon: const Icon(Icons.link),
                      label: 'Copy link',
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_whatsapp.png',
                        height: 16,
                        width: 16,
                      ),
                      label: 'Whatsapp',
                      color: Colors.green,
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_facebook.png',
                        height: 16,
                        width: 16,
                      ),
                      label: 'Facebook',
                      color: Colors.blue[800],
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_twitter.png',
                        height: 16,
                        width: 16,
                      ),
                      label: 'X',
                      color: Colors.lightBlue,
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_pinterest.png',
                        height: 16,
                        width: 16,
                      ),
                      label: 'Pinterest',
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_linkedin.png',
                        height: 16,
                        width: 16,
                      ),
                      label: 'Linkedin',
                      color: Colors.blue[700],
                      onPressed: () {},
                    ),
                    ShareIconButton(
                      icon: Image.asset(
                        'assets/images/ic_instagram.png',
                        height: 58,
                        width: 58,
                      ),
                      label: 'Instagram',
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          )
        : Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: context.heightPercentage(.02),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColors.descText,
                            child: Icon(
                              Icons.close_rounded,
                              size: 12,
                            )),
                      ),
                    ],
                  ),
                  Divider(
                      color: Theme.of(context).hintColor.withOpacity(.6),
                      thickness: 0.2),
                  const SizedBox(height: 20),
                  Flexible(
                    child: ListView(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.politicalPartyName!,
                            style: const TextStyle(
                                color: AppColors.descText,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: context.heightPercentage(.014),
                        ),
                        Container(
                          height: 242,
                          width: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  widget.politicalPartyLogo!,
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          height: context.heightPercentage(.014),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.acrocymn ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.politicalPartyName!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(.6),
                          thickness: 0.3,
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CappCustomButton(
                                onPress: widget.onClickedPrimaryActionButton,
                                color: AppColors.primary,
                                isSolidColor: true,
                                width: context.width * .4,
                                paddingVertical: 12,
                                isActive: true,
                                child: const Text(
                                  'Join Party',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            CappCustomButton(
                              onPress: widget.onClickedSecondaryActionButton,
                              color: AppColors.primary.withOpacity(.1),
                              isSolidColor: true,
                              width: context.width * .4,
                              paddingVertical: 12,
                              isActive: true,
                              child: const Text(
                                'Donate',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: context.heightPercentage(.033),
                        ),
                        SizedBox(
                          height: calculateMainAxisExtent(425),
                          child: ContinueReading(
                            content: widget.partyDetails ?? '',
                            maxline: calculateMaxLines,
                            onClickedContinueReading:
                                widget.onClickedContinueReading,
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        SizedBox(
                          height: calculateListViewExtent,
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.countPartyLeader ?? 0,
                            itemBuilder: (context, int index) {
                              return CappCustomCardView(
                                namePartyLeader: widget.namePartyLeader ?? '',
                                imageUrl: widget.partyLeaderImageUrl ?? '',
                                isCivicVideo: false,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 23,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: context.heightPercentage(.015),
                        ),
                        const Text(
                          'Donations',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 12,
                          width: context.widthPercentage(.8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '200',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            Text(
                              '1,657,345',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class ShareIconButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final Color? color;
  final Function()? onPressed;

  const ShareIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 30, backgroundColor: color, child: icon),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.descText)),
        ],
      ),
    );
  }
}
