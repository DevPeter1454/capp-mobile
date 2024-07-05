import 'dart:async';

import 'package:capp/src/domain/model/explore_category_model.dart';
import 'package:capp/src/presentation/screens/create_poll/create_poll_screen.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/notification/notification_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_navbar.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_uis.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/top_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var searchController = TextEditingController();
  bool showOfflineSubmit = false;

  double calculateMainAxisExtent(double availableHeight) {
    if (context.height <= 667) {
      return availableHeight / context.heightPercentage(0.0065);
    } else if (context.height <= 746) {
      return availableHeight / context.heightPercentage(0.0053);
    } else if (context.height <= 783) {
      return availableHeight / context.heightPercentage(0.0051);
    } else if (context.height <= 812) {
      return availableHeight / context.heightPercentage(0.0050);
    } else if (context.height <= 844) {
      return availableHeight / context.heightPercentage(0.0042);
    } else {
      // Default case for heights greater than 844
      return availableHeight / context.heightPercentage(0.0036);
    }
  }

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {});
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Theme.of(context).highlightColor,
        onRefresh: () async {},
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SafeArea(
                bottom: false,
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: TopHeaderWidget(
                        onClickedNotificationIcon: () =>
                            Get.to(() => NotiificationScreen(
                                  isClickedOnDashBoard: true,
                                  onClicked: () => Get.back(),
                                )),
                        onClickedCreatePoll: () => Get.to(
                            () => const CreatePollScreen(),
                            transition: Transition.cupertino),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  'Explore by Categories',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                              Text(
                                'Select any preferred category below',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.inputHint),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.heightPercentage(0.65),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final availableHeight = constraints.maxHeight;
                              return GridView.builder(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 8),
                                // physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var e = exploreCategorylist[index];
                                  return ExploreByCategoryCard(
                                      title: e.title,
                                      image: e.iconPath,
                                      onTap: () => Get.to(() =>
                                          CappCustomButtomNavBar(
                                              customWidget: e.widgetPath)),
                                      ctnColor: e.color);
                                },
                                itemCount: exploreCategorylist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 0.2,
                                        mainAxisExtent: calculateMainAxisExtent(
                                            availableHeight),
                                        childAspectRatio: 0.2),
                              );
                            },
                          ),
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
  }
}
