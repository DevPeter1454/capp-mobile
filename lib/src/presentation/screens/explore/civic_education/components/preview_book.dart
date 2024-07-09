import 'package:capp/src/domain/model/book_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/read_all_info_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/custom_ui/continue_reading.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewBookScreen extends StatefulWidget {
  final BookModel bookModel;
  const PreviewBookScreen({super.key, required this.bookModel});

  @override
  State<PreviewBookScreen> createState() => _PreviewBookScreenState();
}

class _PreviewBookScreenState extends State<PreviewBookScreen> {
  get calculateMaxLines {
    if (context.height <= 667) {
      return 10;
    } else if (context.height <= 783) {
      return 11;
    } else if (context.height <= 812) {
      return 11;
    } else if (context.height <= 896) {
      return 15;
    } else if (context.height <= 932) {
      return 14;
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
    } else if (context.height <= 783) {
      return availableHeight - 150;
    } else if (context.height <= 812) {
      return availableHeight - 176;
    } else if (context.height <= 896) {
      return availableHeight - 88;
    } else if (context.height <= 932) {
      return availableHeight - 93;
    } else {
      // Default case for heights greater than 932
      return availableHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                CustomTopNavBar(
                  title: "Book Preview",
                  primaryActionButton: 'assets/images/send_black.png',
                  secondaryActionButton: 'assets/images/headphone.png',
                  onClickedPrimaryActionButton: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return const CappCustomBottomSheet();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Container(
                      height: context.height < 750 ? 232 : 332,
                      width: context.height < 750 ? 232 : 332,
                      decoration: BoxDecoration(
                          color: AppColors.descText.withOpacity(.3),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Positioned(
                      top: 3,
                      left: 3.5,
                      child: Container(
                        height: context.height < 750 ? 225 : 325,
                        width: context.height < 750 ? 225 : 325,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.bookModel.imageUrl),
                              fit: BoxFit.contain),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  widget.bookModel.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Author: ${widget.bookModel.author}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.descText),
                ),
                SizedBox(
                  height: 27,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.bookModel.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          )),
                      VerticalDivider(
                          color: Theme.of(context).hintColor.withOpacity(.6),
                          thickness: 0.2),
                      SizedBox(
                        height: 17,
                        width: 33,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ic_book-saved.png',
                              height: 16,
                              width: 16,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(widget.bookModel.numOfPages.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: AppColors.descText)),
                          ],
                        ),
                      ),
                      VerticalDivider(
                          color: Theme.of(context).hintColor.withOpacity(.6),
                          thickness: 0.2),
                      SizedBox(
                        height: 17,
                        child: Row(
                          children: [
                            Image.asset('assets/images/ic_microphone.png'),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(widget.bookModel.time,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    color: AppColors.descText))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: calculateMainAxisExtent(425),
                  child: ContinueReading(
                    content: widget.bookModel.content ?? '',
                    maxline: calculateMaxLines,
                    onClickedContinueReading: () {
                      Get.to(
                        () => ReadAllInfoScreen(
                          title: widget.bookModel.title,
                          isShowPartyInfo: false,
                          content: widget.bookModel.content ?? '',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
