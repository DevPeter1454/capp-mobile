import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/leader_profile/cubit/leader_profile_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/leader_profile/view_allocation_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/leader_all_rating_screen.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/rate_leader_screen.dart';
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
import 'package:intl/intl.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as tr;

class LeaderProfileScreen extends StatefulWidget {
  const LeaderProfileScreen({super.key, required this.leaderProfile});

  final LeaderProfile leaderProfile;

  @override
  State<LeaderProfileScreen> createState() => _LeaderProfileScreenState();
}

class _LeaderProfileScreenState extends State<LeaderProfileScreen> {
  final ScrollController controller = ScrollController();

  final _leaderProfileCubit = getIt.get<LeaderProfileCubit>();

  @override
  void initState() {
    super.initState();
    getLeaderById();
  }

  Future<void> getLeaderById() async {
    await _leaderProfileCubit.getLeaderById(id: widget.leaderProfile.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LeaderProfileCubit, LeaderProfileState>(
      bloc: _leaderProfileCubit,
      listener: (context, state) {
        state.when(
            initial: () {},
            loading: () {
              print("loading...");
            },
            loaded: (leaders) {
              print("got $leaders");
            },
            error: (message) {});
      },
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => const Center(
                  child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                ),
            loaded: (leader) {
              return SafeArea(
                  child: SingleChildScrollView(
                      controller: controller,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTopNavBar(title: leader.name),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: NetworkImage(
                                        LeaderProfile.forTest().profile),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                      child: SizedBox(
                                    width: 177.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          leader.title,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.blackTextColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 12.h),
                                        CappCustomButton(
                                            onPress: () {},
                                            color: AppColors.primary
                                                .withOpacity(0.10),
                                            isSolidColor: true,
                                            width: 150.w,
                                            paddingVertical: 12,
                                            isActive: true,
                                            child: const Text(
                                              'Project Tracking',
                                              style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        SizedBox(height: 12.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "State",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0XFF6C727F)),
                                                ),
                                                Text(
                                                  leader.lga,
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: AppColors
                                                          .blackTextColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: 44.w,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Constituency",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0XFF6C727F)),
                                                ),
                                                Text(
                                                  leader.constituency,
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: AppColors
                                                          .blackTextColor,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return SizedBox(
                                                    height: 497.h,
                                                    width: double.infinity,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.w,
                                                                    vertical:
                                                                        16.h),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Roles & Responsibilities",
                                                                    style: TextStyle(
                                                                        fontSize: 18
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: SvgPicture
                                                                      .asset(
                                                                          "assets/icons/close.svg"),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Theme.of(
                                                                    context)
                                                                .hintColor
                                                                .withOpacity(
                                                                    .6),
                                                            thickness: 0.2,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.w,
                                                                    vertical:
                                                                        16.h),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                // mainAxisAlignment:
                                                                //     MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    leader
                                                                        .responsibility,
                                                                    style: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        color: AppColors
                                                                            .descText),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          50.h),
                                                                  // const Spacer(),
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    // padding: EdgeInsets.symmetric(
                                                    //     horizontal: 20.w, vertical: 10.h),
                                                  );
                                                });
                                          },
                                          child: Row(
                                            children: [
                                              Text("Read More",
                                                  style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SvgPicture.asset(
                                                  "assets/icons/arrow-down.svg")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                              Divider(
                                color:
                                    Theme.of(context).hintColor.withOpacity(.6),
                                thickness: 0.2,
                              ),
                              SizedBox(height: 12.h),
                              CappCustomButton(
                                  onPress: () => Get.to(
                                      () =>
                                          ViewAllocationScreen(leader: leader),
                                      transition: tr.Transition.fadeIn),
                                  color: AppColors.primary.withOpacity(0.10),
                                  isSolidColor: true,
                                  width: double.infinity,
                                  paddingVertical: 12,
                                  isActive: true,
                                  child: const Text(
                                    'View Allocation',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(height: 12.h),
                              SizedBox(
                                  height: 224.h,
                                  width: double.infinity,
                                  child: Text(
                                      "Lorem ipsum dolor sit amet consectetur. Vitae semper nisi libero aliquet fames sit eu mi turpis. Neque commodo ut turpis eros ac felis. Semper volutpat donec risus vestibulum dignissim magna. Magna eleifend rhoncus mattis convallis risus. Elementum laoreet nulla tempus fringilla cras. Eget arcu massa eget lorem eget quisque fa... Continue Reading. Lorem ipsum dolor sit amet consectetur. Vitae semper nisi libero aliquet fames sit eu mi turpis. Neque commodo ut turpis eros ac felis. Semper volutpat donec risus vestibulum dignissim magna. Magna eleifend rhoncus mattis convallis risus. Elementum laoreet nulla tempus fringilla cras. Eget arcu massa eget lorem eget quisque fa... Continue Reading",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.descText))),
                              CappCustomButton(
                                  onPress: () => Get.to(
                                      () =>
                                          RateLeaderScreen(leaderId: leader.id),
                                      transition: tr.Transition.rightToLeft),
                                  color: AppColors.primary.withOpacity(0.10),
                                  isSolidColor: true,
                                  width: double.infinity,
                                  paddingVertical: 12,
                                  isActive: true,
                                  child: const Text(
                                    'Rate and Recommend',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                              SizedBox(height: 20.h),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Ratings and recommendations",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 18.sp,
                                                color: AppColors.blackTextColor,
                                                fontWeight: FontWeight.w600)),
                                    InkWell(
                                      onTap: () => Get.to(
                                          () => LeaderAllRatingScreen(
                                              leaderProfile: leader),
                                          transition: tr.Transition.fadeIn),
                                      child: Text("See all",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontSize: 14.sp,
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w600)),
                                    ),
                                  ]),
                              SizedBox(height: 12.h),
                              leader.ratings.isEmpty
                                  ? const SizedBox.shrink()
                                  : ListView.separated(
                                      itemCount: leader.ratings.length,
                                      shrinkWrap: true,
                                      controller: controller,

                                      itemBuilder: (context, index) {
                                        final rating = double.parse(
                                            leader.ratings[index].toString());
                                        final comment =
                                            leader.comments[index]["comment"];
                                        final user = leader.comments[index]
                                                ["user"]["firstname"] +
                                            leader.comments[index]["user"]
                                                ["surname"];
                                        final date =
                                            leader.comments[index]["createdAt"];
                                        return CustomRatingWidget(
                                          initialRating: rating,
                                          comment: comment,
                                          user: user,
                                          date: DateTime.parse(date),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 12.h);
                                      },
                                      // physics: const NeverScrollableScrollPhysics(),
                                    ),
                              SizedBox(height: 20.h),
                            ]),
                      )));
            },
            orElse: () => const Text("Something went wrong"));
      },
    ));
  }
}

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
    required this.initialRating,
    required this.comment,
    required this.user,
    required this.date,
  });

  final String comment;
  final DateTime date;
  final double initialRating;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 152.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.appGrey),
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar(
              ignoreGestures: true,
              initialRating: initialRating,
              itemSize: 16,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: SvgPicture.asset("assets/icons/star_full.svg"),
                half: SvgPicture.asset("assets/icons/star_full.svg"),
                empty: SvgPicture.asset("assets/icons/star_empty.svg"),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: 12.h),
            Text(
              comment,
              style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
            ),
            SizedBox(height: 12.h),
            Text(
              "by $user  ${DateFormat('dd/MM/yyyy').format(date.toLocal())}",
              style: TextStyle(fontSize: 14.sp, color: AppColors.descText),
            )
          ],
        ));
  }
}
