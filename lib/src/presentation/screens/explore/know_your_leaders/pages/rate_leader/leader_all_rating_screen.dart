import 'package:capp/src/domain/model/leader_profile.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/leader_profile/leaders_profile_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderAllRatingScreen extends StatefulWidget {
  final LeaderProfile leaderProfile;
  const LeaderAllRatingScreen({super.key, required this.leaderProfile});

  @override
  State<LeaderAllRatingScreen> createState() => _LeaderAllRatingScreenState();
}

class _LeaderAllRatingScreenState extends State<LeaderAllRatingScreen> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.leaderProfile.ratings.isEmpty) ...[
                        SizedBox(height: 12.h),
                        const CustomTopNavBar(title: "Rate and Recommend"),
                        SizedBox(height: 60.h),
                        const Center(
                          child: Text("No ratings available yet "),
                        )
                      ],
                      if (widget.leaderProfile.ratings.isNotEmpty) ...[
                        SizedBox(height: 12.h),
                        const CustomTopNavBar(title: "Rate and Recommend"),
                        SizedBox(height: 12.h),
                        ListView.separated(
                          itemCount: widget.leaderProfile.ratings.length,
                          shrinkWrap: true,
                          controller: controller,

                          itemBuilder: (context, index) {
                            final rating = double.parse(
                                widget.leaderProfile.ratings[index].toString());
                            final comment =
                                widget.leaderProfile.comments[index]["comment"];
                            final user = widget.leaderProfile.comments[index]
                                    ["user"]["firstname"] +
                                widget.leaderProfile.comments[index]["user"]
                                    ["surname"];
                            final date = widget.leaderProfile.comments[index]
                                ["createdAt"];
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
                      ],
                    ]))));
  }
}
