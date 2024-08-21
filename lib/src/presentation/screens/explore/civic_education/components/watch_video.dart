import 'package:capp/src/domain/model/video_model.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final Video video;
  final String videoId;
  const WatchVideoScreen({super.key, required this.video, required this.videoId});

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  String videoId = "";

  String extractYouTubeId(String url) {
    final Uri uri = Uri.parse(url);
    if (uri.host == 'youtu.be') {
      return uri.pathSegments.first;
    } else if (uri.host.contains('youtube.com')) {
      if (uri.queryParameters.containsKey('v')) {
        return uri.queryParameters['v']!;
      }
      if (uri.pathSegments.contains('embed')) {
        return uri.pathSegments.last;
      }
      if (uri.pathSegments.contains('watch')) {
        return uri.queryParameters['v']!;
      }
    }
    throw ArgumentError('Invalid YouTube URL');
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, showLiveFullscreenButton: false),
    );
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
                YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: AppColors.primary,
                  progressColors: const ProgressBarColors(
                    playedColor: AppColors.primary,
                    handleColor: AppColors.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.video.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
                // Expanded(
                //   child: SizedBox(
                //     height: context.height * .70,
                //     child: ListView.separated(
                //       // physics: const NeverScrollableScrollPhysics(),
                //       itemBuilder: (context, int index) {
                //         return CappCustomCardView(
                //           imageUrl: "https://img.youtube.com/vi/${extractYouTubeId(videoFiles[index].url)}/0.jpg",,
                //           onTap: () => Get.to(() => WatchVideoScreen(
                //                 videoId: widget.videoId,
                //                 video: videoList[index],
                //               )),
                //         );
                //       },
                //       separatorBuilder: (context, int index) {
                //         return const SizedBox(height: 10);
                //       },
                //       itemCount: videoList.length,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
