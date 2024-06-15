import 'package:capp/src/domain/model/quiz_model.dart';
import 'package:capp/src/domain/model/video_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_video_card.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/quiz/quiz_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchVideoScreen extends StatelessWidget {
  final Video video;
  const WatchVideoScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const CustomTopNavBar(
                  title: "Watch Video",
                ),
                const SizedBox(height: 27),
                Container(
                  height: 227,
                  width: 347,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/vol1.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(8)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    video.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => QuizScreen(quiz: quizzList)),
                  child: const Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Start Quiz',
                          style: TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(width: 6),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Watch Others',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: SizedBox(
                    height: context.height * .70,
                    child: ListView.separated(
                      // physics: const NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
