import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/fgn_support_scheme_model.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/cubit/support_scheme_cubit.dart';
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/pages/support_details_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/fgn_support_scheme_card.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AllSupportSchemesScreen extends StatefulWidget {
  const AllSupportSchemesScreen({super.key});

  @override
  State<AllSupportSchemesScreen> createState() =>
      _AllSupportSchemesScreenState();
}

class _AllSupportSchemesScreenState extends State<AllSupportSchemesScreen> {
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
              loaded: (supportSchemes) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Column(children: [
                      const CustomTopNavBar(title: "All Support Scheme"),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          controller: controller,
                          itemBuilder: (context, index) {
                            List<FgnSupportSchemeModel> supportSchemes =
                                _supportSchemes;
                            return GestureDetector(
                              onTap: () => Get.to(
                                () => SupportDetailsScreen(
                                  id: supportSchemes[index].id,
                                  title: supportSchemes[index].title,
                                  body: supportSchemes[index].body,
                                  url: supportSchemes[index].url,
                                  isFavorite: supportSchemes[index].isFavorite,
                                  acronym: supportSchemes[index].acronym,
                                ),
                              ),
                              child: FgnSupportSchemeCard(
                                logoUrl: supportSchemes[index].url,
                                title: supportSchemes[index].title,
                                acronym: supportSchemes[index].acronym,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color:
                                  Theme.of(context).hintColor.withOpacity(.6),
                              thickness: 0.2,
                            );
                          },
                          itemCount: _supportSchemes.length)
                    ]),
                  ),
                );
              },
              orElse: () => const Text("Something went wrong"));
        },
      ),
    );
  }
}
