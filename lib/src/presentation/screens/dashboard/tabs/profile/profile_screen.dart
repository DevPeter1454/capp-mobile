import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'components/profile_item_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String kyc = '', fullname = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  // Future _refresh() {
  //   return ;
  // }

  logoutUser() {
    Get.offAllNamed(
      RouteConstants.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return Material(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Theme.of(context).highlightColor,
          onRefresh: () async {
            // await _refresh();
          },
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * .05,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Profile",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: Image.asset(
                                    'assets/images/profile-tick.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const SizedBox(
                                    height: 40,
                                    width: 200,
                                    child: Text(
                                      'Precious Batta',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ))
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
                              cardPressed: () {},
                              cardText: 'Edit Information',
                              iconWidget:
                                  Image.asset('assets/images/ic_profile.png'),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).hintColor.withOpacity(.6),
                            thickness: 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ProfileItemWidget(
                              cardPressed: () {},
                              cardText: 'Change Password',
                              iconWidget:
                                  Image.asset('assets/images/ic_lock.png'),
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
                              iconWidget:
                                  Image.asset('assets/images/ic_logout.png'),
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
            ),
          ),
        ),
      );
    });
  }
}
