import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/cubit/rate_leader_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/successful_rating_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as tr;

class RateLeaderScreen extends StatefulWidget {
  final String leaderId;
  const RateLeaderScreen({super.key, required this.leaderId});

  @override
  State<RateLeaderScreen> createState() => _RateLeaderScreenState();
}

class _RateLeaderScreenState extends State<RateLeaderScreen> {
  double _rating = 0;
  final _rateLeaderCubit = getIt.get<RateLeaderCubit>();
  final TextEditingController controller = TextEditingController();
  Future<void> rateLeader() async {
    print(_rating);
    await _rateLeaderCubit.rateLeader(
        id: widget.leaderId, rating: _rating, comment: controller.text);
  }

  void setRating(double rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<RateLeaderCubit, RateLeaderState>(
      bloc: _rateLeaderCubit,
      listener: (context, state) {
        state.maybeWhen(
            loaded: (leader) {
              if (leader.id.isNotEmpty) {
                Get.off(() => const SuccessfulRatingScreen(),
                    transition: tr.Transition.fade);
              } else {
                Get.snackbar("Error", "An error occurred while rating leader");
              }
            },
            orElse: () {});
      },
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => const Center(
                  child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                ),
            initial: () {
              return SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTopNavBar(title: "Rate and Recommend"),
                        SizedBox(height: 12.h),
                        Text(
                          "Please rate and recommend ideas for your ministers below",
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.descText),
                        ),
                        SizedBox(height: 12.h),
                        Center(
                          child: RatingBar(
                            initialRating: 0,
                            itemSize: 32.sp,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: SvgPicture.asset(
                                  "assets/icons/star_full.svg"),
                              half: SvgPicture.asset(
                                  "assets/icons/star_full.svg"),
                              empty: SvgPicture.asset(
                                  "assets/icons/star_empty.svg"),
                            ),
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            onRatingUpdate: (rating) {
                              setState(() {
                                _rating = rating;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Divider(
                          color: Theme.of(context).hintColor.withOpacity(.6),
                          thickness: 0.2,
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          height: 134.h,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "Enter recommendation",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackTextColor)),
                                TextSpan(
                                    text: " (not more than 150 words)",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.descText))
                              ])),
                              SizedBox(height: 5.h),
                              CappCustomFormField(
                                  maxLines: 4,
                                  controller: controller,
                                  hintText: "Enter brief recommendation",
                                  // maxLength: 150,
                                  fillColor: const Color(0XFFF4F4F6),
                                  borderColor: Colors.transparent)
                            ],
                          ),
                        ),
                        SizedBox(height: 300.h),
                        CappCustomButton(
                          onPress: () {
                            rateLeader();
                            // Get.off(() => const SuccessfulRatingScreen(),
                            //     transition: Transition.fade);
                          },
                          isActive: true,
                          color: AppColors.primary,
                          isSolidColor: true,
                          width: double.infinity,
                          child: Text("Submit",
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white)),
                        ),
                      ]),
                ),
              ));
            },
            loaded: null,
            orElse: () => const Text("Something went wrong"));
      },
    ));
  }
}
