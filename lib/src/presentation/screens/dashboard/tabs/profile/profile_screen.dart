import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/data_source/network/error/capp_error_screen.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/pages/edit_info_screen.dart';
import 'package:capp/src/presentation/screens/forgotPassword/create_new_password_screen.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'components/profile_item_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final _profileCubit = getIt.get<UserProfileCubit>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    _profileCubit.getUserInfo();
  }

  logoutUser() {
    _profileCubit.logOut();
    Get.offAllNamed(
      RouteConstants.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Theme.of(context).highlightColor,
        onRefresh: () async {
          // await _refresh();
        },
        child: Scaffold(
          key: scaffoldKey,
          body: BlocBuilder<UserProfileCubit, UserProfileState>(
            bloc: _profileCubit,
            builder: (context, state) {
              return state.map(
                initial: (_) => const SizedBox.shrink(),
                updateSuccessful: (_) => const SizedBox.shrink(),
                loading: (_) {
                  return Scaffold(
                    body: SizedBox(
                      height: context.height,
                      width: context.width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Loading .....',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  );
                },
                error: (error) {
                  return CappErrorScreen(
                    errorType: ErrorType.unknownAppError,
                    onTryAgain: () => _profileCubit.getUserInfo(),
                  );
                },
                retrieved: (value) {
                  return SafeArea(
                    bottom: false,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: context.height * .05,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Profile",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 17,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/profile-tick.png',
                                        height: 32,
                                        width: 32,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        width: 200,
                                        child: Row(
                                          children: [
                                            Text(
                                              value.user.firstname,
                                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              value.user.surname,
                                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'See and edit your profile information below',
                                    style: TextStyle(color: AppColors.inputHint),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: ProfileItemWidget(
                                    cardPressed: () => Get.to(() => EditProfileInfo(
                                          userData: value.user,
                                        )),
                                    cardText: 'Edit Information',
                                    iconWidget: Image.asset(
                                      'assets/images/ic_profile.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).hintColor.withOpacity(.6),
                                  thickness: 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: ProfileItemWidget(
                                    cardPressed: () => Get.to(() => const CreateNewPasswordScreen(
                                          isForgotPassword: false,
                                        )),
                                    cardText: 'Change Password',
                                    iconWidget: Image.asset(
                                      'assets/images/ic_lock.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).hintColor.withOpacity(.6),
                                  thickness: 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: ProfileItemWidget(
                                    cardPressed: () {
                                      logoutUser();
                                    },
                                    cardText: 'Logout',
                                    iconWidget: Image.asset(
                                      'assets/images/ic_logout.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context).hintColor.withOpacity(.6),
                                  thickness: 0.2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
