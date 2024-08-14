import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/cubit/know_your_leaders_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/leader_profile/leaders_profile_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_list_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as tr;

class KnowYourLeader extends StatefulWidget {
  const KnowYourLeader({super.key});

  @override
  State<KnowYourLeader> createState() => _KnowYourLeaderState();
}

class _KnowYourLeaderState extends State<KnowYourLeader> {
  final _searchController = TextEditingController();
  final ScrollController controller = ScrollController();
  final _knowYourLeaderCubit = getIt.get<KnowYourLeadersCubit>();

  @override
  void initState() {
    super.initState();
    getAllLeaders();
  }

  Future<void> getAllLeaders() async {
    await _knowYourLeaderCubit.getAllLeaders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<KnowYourLeadersCubit, KnowYourLeadersState>(
        bloc: _knowYourLeaderCubit,
        listener: (context, state) {
          state.when(
              initial: () {},
              loading: () {
                print("loading...");
              },
              loaded: (leaders) {
                print("got ${leaders.length}");
              },
              error: (message) {
                print("Error: $message");
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
            ),
            orElse: () => const Text("Something went wrong"),
            loaded: (leaders) {
              return SafeArea(
                child: SingleChildScrollView(
                  controller: controller,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: CustomTopNavBar(title: "Back to home"),
                            ),
                            Column(
                              children: [
                                SizedBox(height: 26.h),
                                SvgPicture.asset(
                                    "assets/icons/notification.svg"),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/people.svg',
                              height: 32.h,
                              width: 32.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Know your Leaders',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Get to know more about your leaders',
                          style: TextStyle(
                              color: AppColors.descText, fontSize: 14.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CappCustomFormField(
                          fillColor: const Color(0XFFF4F4F6),
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: Color(0XFF828282),
                          ),
                          borderColor: Colors.transparent,
                          hintText: "Search by Leaders name...",
                          hintStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.separated(
                          controller: controller,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            final item = leaders[index];
                            return GestureDetector(
                              onTap: () => Get.to(
                                  () => LeaderProfileScreen(
                                        leaderProfile: item,
                                      ),
                                  transition:
                                      tr.Transition.rightToLeftWithFade),
                              child: CustomListCard(
                                title: item.name,
                                isKnowMDA: false,
                                ctnWidth: 70.w,
                                ctnheight: 70.h,
                                politicalPartyImageUrl: item.url,
                                officeHolderName: item.title,
                              ),
                            );
                          },
                          separatorBuilder: (context, int index) {
                            return Divider(
                              color:
                                  Theme.of(context).hintColor.withOpacity(.6),
                              thickness: 0.2,
                            );
                          },
                          itemCount: leaders.length,
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
