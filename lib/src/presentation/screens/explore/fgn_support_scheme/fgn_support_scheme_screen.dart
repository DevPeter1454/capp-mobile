// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/cubit/support_scheme_cubit.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/pages/all_support_schemes.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/pages/support_details_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/fgn_support_scheme_card.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:capp/src/domain/model/fgn_support_scheme_model.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:get/get.dart';

class FGNSupportScheme extends StatefulWidget {
  const FGNSupportScheme({super.key});

  @override
  State<FGNSupportScheme> createState() => _FGNSupportSchemeState();
}

class _FGNSupportSchemeState extends State<FGNSupportScheme> {
  final ScrollController controller = ScrollController();
  final _supportSchemeCubit = getIt.get<SupportSchemeCubit>();
  List<FgnSupportSchemeModel> _supportSchemes = [];

  @override
  void initState() {
    super.initState();
    getSupportSchemes();
  }

  Future<void> getSupportSchemes() async {
    final response = await _supportSchemeCubit.getSupportSchemes();
    // print("response from screen $response");
    setState(() {
      _supportSchemes = response;
    });
    // print("new schesmes $_supportSchemes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SupportSchemeCubit, SupportSchemeState>(
        bloc: _supportSchemeCubit,
        listener: (context, state) {
          state.maybeWhen(
              loading: () {
                context.showLoadingDialog();
              },
              error: (message) {
                context.hideLoadingDialog();
                context.showSnackBar(message);
              },
              loaded: (supportSchemes) {},
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child:
                        SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              orElse: () => const Text("Something went wrong"),
              loaded: (supportSchemes) {
                return SafeArea(
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomTopNavBar(title: "Back to home"),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/support.svg',
                                  height: 32,
                                  width: 32,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'FGN Support Scheme',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'See various support scheme by the federal government of Nigeria',
                              style: TextStyle(
                                color: AppColors.descText,
                                fontSize: 14.sp,
                              ),
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
                              hintText: "Search by name",
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Favorites",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
                                              color: AppColors.blackTextColor,
                                              fontWeight: FontWeight.w600)),
                                  InkWell(
                                    onTap: () {},
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
                            SizedBox(height: 10.h),
                            Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/icons/folder-empty.svg"),
                                    SizedBox(
                                      height: 42.h,
                                      width: 294.w,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                                "No favorites added yet, select ‘New Folder’",
                                                style: TextStyle(
                                                    color: AppColors.descText,
                                                    fontSize: 14.sp)),
                                            Text("to create a collection",
                                                style: TextStyle(
                                                    color: AppColors.descText,
                                                    fontSize: 14.sp)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Support Schemes",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.sp,
                                              color: AppColors.blackTextColor,
                                              fontWeight: FontWeight.w600)),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() =>
                                          const AllSupportSchemesScreen());
                                    },
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
                            SizedBox(
                              height: 16.h,
                            ),
                            // FgnSupportSchemeCard()
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.72,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  controller: controller,
                                  itemBuilder: (context, index) {
                                    List<FgnSupportSchemeModel> supportSchemes =
                                        _supportSchemes;
                                    return GestureDetector(
                                      onTap: () => Get.to(() =>
                                          SupportDetailsScreen(
                                            id: supportSchemes[index].id,
                                            title: supportSchemes[index].title,
                                            body: supportSchemes[index].body,
                                            url: supportSchemes[index].url,
                                            isFavorite: supportSchemes[index]
                                                .isFavorite,
                                            acronym:
                                                supportSchemes[index].acronym,
                                          )),
                                      child: FgnSupportSchemeCard(
                                        logoUrl: supportSchemes[index].url,
                                        title: supportSchemes[index].title,
                                        acronym: supportSchemes[index].acronym,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      color: Theme.of(context)
                                          .hintColor
                                          .withOpacity(.6),
                                      thickness: 0.2,
                                    );
                                  },
                                  itemCount: _supportSchemes.length),
                            )
                          ]),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
