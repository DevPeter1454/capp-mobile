import 'package:capp/src/domain/model/quiz_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/quiz/quiz_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadAllInfoScreen extends StatefulWidget {
  final String title, content;
  final bool isShowPartyInfo;

  const ReadAllInfoScreen({Key? key, required this.title, required this.content, this.isShowPartyInfo = true}) : super(key: key);

  @override
  _ReadAllInfoScreenState createState() => _ReadAllInfoScreenState();
}

class _ReadAllInfoScreenState extends State<ReadAllInfoScreen> {
  int _currentPage = 0;
  late final List<String> pages;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  // }
  List<String> _splitContentByPeriod(String content) {
    return content.split('.').map((s) => '${s.trim()}.').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              CustomTopNavBar(
                title: "Read here",
                spacing: 0.35,
                primaryActionButton: 'assets/images/send_black.png',
                secondaryActionButton: 'assets/images/headphone.png',
                onClickedPrimaryActionButton: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return const CappCustomBottomSheet();
                    },
                  );
                },
              ),
              // PageView for content
              Expanded(
                child: SizedBox(
                  height: context.height,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final List<String> contentList = _splitContentByPeriod(widget.content);

                      final maxLines = (constraints.maxHeight / 52).floor();

                      return PageView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: (contentList.length / maxLines).ceil(),
                        controller: _pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, pageIndex) {
                          final start = pageIndex * maxLines;

                          final end = (start + maxLines).clamp(0, contentList.length);
                          final pageContent = contentList.sublist(start, end).join(' ');
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 52,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${_currentPage + 1} / ${(contentList.length / maxLines).ceil()}',
                                            style: const TextStyle(color: AppColors.descText),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    pageContent,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.descText,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: _currentPage > 0
                                            ? () => _pageController.previousPage(
                                                  duration: const Duration(milliseconds: 200),
                                                  curve: Curves.easeInOut,
                                                )
                                            : null,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              size: 16,
                                              color: _currentPage < 1 ? Colors.grey : Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              'Prev',
                                              style: TextStyle(color: _currentPage < 1 ? Colors.grey : Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: _currentPage < (contentList.length / maxLines).ceil() - 1
                                            ? () => _pageController.nextPage(
                                                  duration: const Duration(milliseconds: 200),
                                                  curve: Curves.easeInOut,
                                                )
                                            : widget.isShowPartyInfo
                                                ? null
                                                : () => Get.to(() => const QuizScreen()),
                                        child: Row(
                                          children: [
                                            _currentPage < (contentList.length / maxLines).ceil() - 1
                                                ? const Text('Next')
                                                : widget.isShowPartyInfo
                                                    ? const SizedBox.shrink()
                                                    : const Text('Start Quiz'),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            _currentPage < (contentList.length / maxLines).ceil() - 1
                                                ? const Icon(
                                                    Icons.arrow_forward_ios_rounded,
                                                    size: 16,
                                                  )
                                                : widget.isShowPartyInfo
                                                    ? const SizedBox.shrink()
                                                    : const Icon(
                                                        Icons.arrow_forward_ios_rounded,
                                                        size: 16,
                                                      ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
