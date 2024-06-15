import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/domain/model/book_model.dart';
import 'package:capp/src/domain/model/video_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_video_card.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/preview_book.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/watch_video.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CivicEducationScreen extends StatefulWidget {
  const CivicEducationScreen({super.key});

  @override
  State<CivicEducationScreen> createState() => _CivicEducationScreenState();
}

class _CivicEducationScreenState extends State<CivicEducationScreen> {
  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight * .65;
    } else if (context.height <= 783) {
      return availableHeight * .59;
    } else if (context.height <= 812) {
      return availableHeight * .57;
    } else if (context.height <= 844) {
      return availableHeight * .52;
    } else {
      // Default case for heights greater than 844
      return availableHeight * .49;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                const CustomTopNavBar(title: "Back to home"),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/ic_civic_eduction.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Civic Education',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Access comprehensive resources to enhance your understanding of governance, rights and \nresponsibilities.',
                  style: TextStyle(
                    color: AppColors.descText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Books',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteConstants.viewAllCivicBooks),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  // color: Colors.brown,
                  height: calculateMainAxisExtent(context.height),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, int index) {
                      var e = civicBooksList[index];
                      return CivicBooksCardView(
                          title: e.title,
                          imageUrl: e.imageUrl,
                          time: e.time,
                          numofPages: e.numOfPages.toString(),
                          author: e.author,
                          onClickedRead: () =>
                              Get.to(() => PreviewBookScreen(bookModel: e)),
                          category: e.category);
                    },
                    separatorBuilder: (context, int index) {
                      return Divider(
                        color: Theme.of(context).hintColor.withOpacity(.6),
                        thickness: 0.2,
                      );
                    },
                    itemCount: civicBooksList.length,
                  ),
                ),
                Divider(
                  color: Theme.of(context).hintColor.withOpacity(.6),
                  thickness: 0.3,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Videos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteConstants.viewAllCivicVideo),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: context.height * .70,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return CappCustomCardView(
                          onTap: () => Get.to(() => WatchVideoScreen(
                                video: videoList[index],
                              )),
                        );
                      },
                      separatorBuilder: (context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: videoList.length,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
