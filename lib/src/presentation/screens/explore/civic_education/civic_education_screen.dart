import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/book_model.dart';
import 'package:capp/src/domain/model/video_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_book_cardview.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/civic_video_card.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/preview_book.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/watch_video.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/cubit/civic_education_cubit.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/pages/read_pdf_screen.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/quiz/quiz_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  void initState() {
    super.initState();
    getCivicEducationList();
  }

  final _civicEducationCubit = getIt.get<CivicEducationCubit>();

  Future<void> getCivicEducationList() async {
    final response = await _civicEducationCubit.getCivicEducation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CivicEducationCubit, CivicEducationState>(
        bloc: _civicEducationCubit,
        listener: (context, state) {
          state.maybeWhen(
              loaded: (loaded) {
                print("loaded $loaded");
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              loaded: (loaded) {
                final pdfFiles = loaded.where((element) => element.type == "pdf").toList();
                final videoFiles = loaded.where((element) => element.type == "video").toList();
                return SafeArea(
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
                              SvgPicture.asset(
                                'assets/icons/civic.svg',
                                height: 32.h,
                                width: 32.w,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Civic Education',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                            children: [
                              Text("Take a quiz ", style: TextStyle(fontSize: 12.sp)),
                              GestureDetector(
                                onTap: () => Get.to(() => const QuizScreen()),
                                child: const Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Start Quiz',
                                        style: TextStyle(color: AppColors.primary, decoration: TextDecoration.underline),
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
                            ],
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Books',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(RouteConstants.viewAllCivicBooks, arguments: pdfFiles),
                                child: const Text(
                                  'See All',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          pdfFiles.isEmpty
                              ? const Center(
                                  child: Text('No items available'),
                                )
                              : SizedBox(
                                  // color: Colors.brown,
                                  height: calculateMainAxisExtent(context.height),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, int index) {
                                      var e = pdfFiles[index];
                                      return CivicBooksCardView(
                                          title: e.name,
                                          imageUrl: e.coverImageUrl,
                                          time: e.createdAt.toIso8601String(),
                                          numofPages: e.pageNumber.toString(),
                                          author: e.author,
                                          onClickedRead: () => Get.to(() => ReadPdfScreen(pdfUrl: e.url)),
                                          category: e.category);
                                    },
                                    separatorBuilder: (context, int index) {
                                      return Divider(
                                        color: Theme.of(context).hintColor.withOpacity(.6),
                                        thickness: 0.2,
                                      );
                                    },
                                    itemCount: pdfFiles.length,
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
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(RouteConstants.viewAllCivicVideo),
                                child: const Text(
                                  'See All',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            child: videoFiles.isEmpty
                                ? const Center(
                                    child: Text('No items available'),
                                  )
                                : SizedBox(
                                    height: context.height,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      // physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, int index) {
                                        return CappCustomCardView(
                                          title: videoFiles[index].name,
                                          imageUrl: "https://img.youtube.com/vi/${extractYouTubeId(videoFiles[index].url)}/0.jpg",
                                          onTap: () => Get.to(() => WatchVideoScreen(
                                                videoId: extractYouTubeId(videoFiles[index].url),
                                                video: Video(title: videoFiles[index].name),
                                              )),
                                        );
                                      },
                                      separatorBuilder: (context, int index) {
                                        return SizedBox(height: 10.h);
                                      },
                                      itemCount: videoFiles.length,
                                    ),
                                  ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              },
              orElse: () => const Text("Something went wrong"));
        },
      ),
    );
  }
}
