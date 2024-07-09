import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TopHeaderWidget extends StatefulWidget {
  const TopHeaderWidget({
    Key? key,
    this.onClickedCreatePoll,
    this.onClickedNotificationIcon,
  }) : super(key: key);
  final Function()? onClickedCreatePoll;
  final Function()? onClickedNotificationIcon;

  @override
  State<TopHeaderWidget> createState() => _TopHeaderWidgetState();
}

class _TopHeaderWidgetState extends State<TopHeaderWidget> {
  final _userProfileCubit = getIt.get<UserProfileCubit>();

  @override
  void initState() {
    super.initState();
    _userProfileCubit.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: size.width * .02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * .58,
                      child: const Text(
                        'Hello 🎉',
                        style: TextStyle(
                          fontSize: 16,
                          height: 2,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    BlocBuilder<UserProfileCubit, UserProfileState>(
                      bloc: _userProfileCubit,
                      builder: (context, state) {
                        return state.when(
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SpinKitCubeGrid(
                              color: AppColors.primary, size: 15.0),
                          retrieved: (userData) => GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 2, 4, 2),
                              child: SizedBox(
                                width: size.width * .4,
                                child: Text(
                                  '${userData.firstname} ${userData.surname}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          error: (message) => const Text(
                            'Error retrieving name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  width: context.widthPercentage(.17),
                ),
                Expanded(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: widget.onClickedCreatePoll,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Center(
                            child:
                                Image.asset('assets/images/create_polls.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.widthPercentage(.030),
                      ),
                      GestureDetector(
                        onTap: widget.onClickedNotificationIcon,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                child: Image.asset(
                                    'assets/images/notification.png'),
                              ),
                            ),
                            const Positioned(
                              right: 2,
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .02),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, int index) {
                  return Container(
                    width: 303,
                    height: 101,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/dashborad_header_img.png'),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(
                            8)), // Add margin between items
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
