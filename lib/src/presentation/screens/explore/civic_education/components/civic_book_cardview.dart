import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CivicBooksCardView extends StatelessWidget {
  final String title, imageUrl, time, numofPages, author, category;
  final Function()? onClickedRead;
  const CivicBooksCardView({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.time,
    required this.numofPages,
    required this.author,
    required this.category,
    required this.onClickedRead,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: AppColors.descText.withOpacity(.3),
                  borderRadius: BorderRadius.circular(8)),
            ),
            Positioned(
              top: 4,
              left: 5,
              child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageUrl), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(8))),
            )
          ],
        ),
        SizedBox(
          width: context.width > 375
              ? context.widthPercentage(.026)
              : context.widthPercentage(.015),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: AppColors.descText),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              'Author: $author',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.descText),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                SizedBox(
                  height: 17,
                  width: 33,
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_book-saved.png'),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(numofPages,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.descText))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 17,
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_microphone.png'),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(time,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: AppColors.descText))
                    ],
                  ),
                ),
                SizedBox(
                  width: context.widthPercentage(.025),
                ),
                CappCustomButton(
                  onPress: onClickedRead,
                  color: AppColors.primary.withOpacity(.1),
                  isSolidColor: true,
                  width: context.width * .2,
                  paddingVertical: 12,
                  isActive: true,
                  child: const Text(
                    'Read',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
