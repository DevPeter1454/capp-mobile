import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/new_quiz_model.dart';
import 'package:capp/src/domain/model/quiz_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/quiz/cubit/quiz_cubit.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/result/result_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  // final List<QuizModel> quiz;
  const QuizScreen({super.key, });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  int _currentPage = 0;
  int levelClock = 30;
  late final PageController _pageController;
  int selectedOption = 0;
  Map<int, int> userAnswers = {};

  final _quizCubit = getIt.get<QuizCubit>();

  List<Quiz> _quizQuestions = [];
  final List<int> _selectedOptions = [];
  final List<String> _options = ['A', 'B', "C", "D"];

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
    getQuizList();
    _pageController = PageController(initialPage: 0);
    _controller = AnimationController(vsync: this, duration: Duration(seconds: levelClock))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _moveToNextQuestion();
        }
      });
    _controller?.forward();
  }

  Future<void> getQuizList() async {
    final response = await _quizCubit.getQuizList();
    setState(() {
      _quizQuestions = response;
    });
    print("response from $response");
  }

  void _moveToNextQuestion() {
    if (_currentPage < _quizQuestions[7].questions.length - 1) {
      print("heree");
      setState(() {
        _pageController.animateToPage(_currentPage + 1, duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
        selectedOption = 0;
        _controller?.reset();
        _controller?.forward();
      });
    } else {
      {
        userAnswers[_currentPage] = selectedOption;

        List<int> keysList = userAnswers.values.toList();

        int score = 0;
        for (var i = 0; i < _quizQuestions[7].questions.length; i++) {
          final correctAnswer = _quizQuestions[7].questions[i].correctOptionIndex; // Assuming the first value in question.values is the answer
          if (keysList[i] == correctAnswer) {
            score++;
          }
        }
        Get.offAll(() => ResultScreen(score: score, totalQuestions: _quizQuestions[7].questions.length));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<QuizCubit, QuizState>(
      bloc: _quizCubit,
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
              return SafeArea(
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
                                '${_currentPage + 1} / ${_quizQuestions[7].questions.length}',
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
                                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
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
                            itemCount: _quizQuestions[7].questions.length,
                            controller: _pageController,
                            onPageChanged: (int index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              var item = _quizQuestions[7].questions[index];
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
                                                item.text,
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
                                                image: AssetImage('assets/images/quiz_backdrop.png'),
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
                                                  image: AssetImage('assets/images/quiz_backdrop.png'),
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
                                                  border: Border.all(color: AppColors.appGrey, width: 1),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                      width: 50,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(_options.elementAt(index)),
                                                        ],
                                                      ),
                                                    ),
                                                    VerticalDivider(
                                                      color: Theme.of(context).hintColor,
                                                      thickness: 0.2,
                                                    ),
                                                    Expanded(
                                                      child: SizedBox(
                                                        width: context.widthPercentage(.06),
                                                        child: Text(item.options.elementAt(index)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.heightPercentage(.08),
                                                      child: Radio<int>(
                                                          value: index,
                                                          groupValue: selectedOption,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedOption = value!;
                                                              // _selectedOptions.insert(_currentPage, index);
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
                          onPress: _currentPage == _quizQuestions[7].questions.length - 1
                              ? () {
                                  userAnswers[_currentPage] = selectedOption;

                                  List<int> keysList = userAnswers.values.toList();

                                  int score = 0;
                                  // print(userAnswers);

                                  for (var i = 0; i < _quizQuestions[7].questions.length; i++) {
                                    final correctAnswer = _quizQuestions[7]
                                        .questions[i]
                                        .correctOptionIndex; // Assuming the first value in question.values is the answer
                                    if (keysList[i] == correctAnswer) {
                                      // print("correct");
                                      score++;
                                    }
                                  }
                                  // print(score);

                                  Get.offAll(() => ResultScreen(score: score, totalQuestions: _quizQuestions[7].questions.length));
                                }
                              : () {
                                  print("here $_currentPage");
                                  userAnswers[_currentPage] = selectedOption;
                                  print(userAnswers);

                                  setState(() {
                                    selectedOption = 0;
                                    _pageController.animateToPage(_currentPage + 1,
                                        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
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
                            _currentPage == _quizQuestions[7].questions.length - 1 ? 'See Result' : 'Next Question',
                            style: const TextStyle(color: AppColors.primary, fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            },
            orElse: () => const Text("Something went wrong"));
      },
    ));
  }
}
