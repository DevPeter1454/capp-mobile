import 'package:capp/src/domain/model/quiz_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/result/result_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizModel> quiz;
  const QuizScreen({super.key, required this.quiz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  int _currentPage = 0;
  int levelClock = 30;
  late final PageController _pageController;
  int selectedOption = 0;
  Map<int, String> userAnswers = {};

  @override
  void dispose() {
    if (_controller != null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: levelClock))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _moveToNextQuestion();
        }
      });
    _controller?.forward();
  }

  void _moveToNextQuestion() {
    if (_currentPage < widget.quiz.length - 1) {
      setState(() {
        _pageController.animateToPage(_currentPage + 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceIn);
        selectedOption = 0;
        _controller?.reset();
        _controller?.forward();
      });
    } else {
      {
        int score = 0;
        for (var i = 0; i < widget.quiz.length; i++) {
          final correctAnswer = widget.quiz[i].question.values
              .first; // Assuming the first value in question.values is the answer
          if (userAnswers[i] == correctAnswer) {
            score++;
          }
        }
        Get.offAll(() =>
            ResultScreen(score: score, totalQuestions: widget.quiz.length));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            const CustomTopNavBar(
              title: "Quiz",
            ),
            const SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Question'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${_currentPage + 1} / ${widget.quiz.length}',
                      style: const TextStyle(color: AppColors.descText),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryLight.withOpacity(.5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 10,
                          ),
                          Countdown(
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              animation: StepTween(
                                begin: levelClock,
                                end: 0,
                              ).animate(_controller!)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SizedBox(
                height: context.heightPercentage(.6),
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.quiz.length,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    var item = widget.quiz[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primary,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 23,
                                  left: 13,
                                  child: SizedBox(
                                    width: 340,
                                    child: Text(
                                      item.question.keys.first,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 180,
                                  width: 94,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/quiz_backdrop.png'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 4,
                                  child: Container(
                                    height: 180,
                                    width: 94,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/quiz_backdrop.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: context.heightPercentage(0.7),
                              child: ListView.separated(
                                  padding: const EdgeInsets.only(top: 10),
                                  itemBuilder: (context, int index) {
                                    return Container(
                                      height: 50,
                                      width: 327,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.4),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: AppColors.appGrey, width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(item.options.keys
                                                    .elementAt(index)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(
                                            color: Theme.of(context).hintColor,
                                            thickness: 0.2,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              width:
                                                  context.widthPercentage(.06),
                                              child: Text(item.options.values
                                                  .elementAt(index)),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                context.heightPercentage(.08),
                                            child: Radio<int>(
                                                value: index,
                                                groupValue: selectedOption,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedOption = value!;
                                                    userAnswers[_currentPage] =
                                                        item.options.keys
                                                            .elementAt(index);
                                                  });
                                                }),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, int index) {
                                    return const SizedBox(
                                      height: 9,
                                    );
                                  },
                                  itemCount: item.options.length),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12),
              child: CappCustomButton(
                onPress: _currentPage == widget.quiz.length - 1
                    ? () {
                        int score = 0;
                        for (var i = 0; i < widget.quiz.length; i++) {
                          final correctAnswer = widget.quiz[i].question.values
                              .first; // Assuming the first value in question.values is the answer
                          if (userAnswers[i] == correctAnswer) {
                            score++;
                          }
                        }
                        Get.offAll(() => ResultScreen(
                            score: score, totalQuestions: widget.quiz.length));
                      }
                    : () {
                        setState(() {
                          selectedOption = 0;
                          _pageController.animateToPage(_currentPage + 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceIn);
                          _controller?.reset();
                          _controller?.forward();
                        });
                      },
                color: AppColors.primary.withOpacity(.1),
                isSolidColor: true,
                width: context.widthPercentage(.4),
                paddingVertical: 12,
                isActive: true,
                child: Text(
                  _currentPage == widget.quiz.length - 1
                      ? 'See Result'
                      : 'Next Question',
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
