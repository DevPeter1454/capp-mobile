import 'package:capp/src/domain/model/video_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_video_card.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/watch_video.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllVidoesScreen extends StatelessWidget {
  const ViewAllVidoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const CustomTopNavBar(title: 'All Videos'),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: SizedBox(
                  height: context.height,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    itemBuilder: (context, int index) {
                      return const CappCustomCardView(
                          // onTap: () => Get.to(() => WatchVideoScreen(

                          //       video: videoList[index],
                          //     )),
                          );
                    },
                    separatorBuilder: (context, int index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: videoList.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
