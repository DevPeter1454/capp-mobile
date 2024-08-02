import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/political_party_model.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/cubit/know_your_mda_cubit.dart';
import 'package:capp/src/presentation/screens/explore/know_your_mda/pages/mda_details_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_list_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class KnowYourMDA extends StatefulWidget {
  const KnowYourMDA({super.key});

  @override
  State<KnowYourMDA> createState() => _KnowYourMDAState();
}

class _KnowYourMDAState extends State<KnowYourMDA> {
  final _searchController = TextEditingController();

  final _knowYourMdaCubit = getIt.get<KnowYourMdaCubit>();

  Future<void> getMdasList() async {
    final response = await _knowYourMdaCubit.getMdasList();
    print("response from screen $response");
  }

  @override
  void initState() {
    super.initState();
    getMdasList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<KnowYourMdaCubit, KnowYourMdaState>(
        bloc: _knowYourMdaCubit,
        listener: (context, state) {
          state.maybeWhen(
              loading: () {
                context.showLoadingDialog();
              },
              error: (message) {
                context.hideLoadingDialog();
                context.showSnackBar(message);
              },
              loaded: (mdas) {
                // context.hideLoadingDialog();
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              loaded: (mdas) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            const CustomTopNavBar(title: "Back to home"),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_know_your_mda.png',
                                  height: 32,
                                  width: 32,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Know your MDA\'s',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Get to know your ministers and the various offices they hold',
                              style: TextStyle(
                                color: AppColors.descText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SizedBox(
                                width: context.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CappCustomFormField(
                                    hintText: 'Search by Ministry, Department or agency',
                                    onChanged: (val) {},
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    keyboardType: TextInputType.text,
                                    fillColor: AppColors.appGrey.withOpacity(.3),
                                    radius: 8.r,
                                    prefixIcon: const Icon(
                                      CupertinoIcons.search,
                                      color: Color(0XFF828282),
                                    ),
                                    controller: _searchController,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                final mda = mdas[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => MdaDetailsScreen(mda: mda));
                                  },
                                  child: CustomListCard(
                                    title: mda.ministryName,
                                    isKnowMDA: true,
                                    mdaImageUrl: mda.ministryLogo,
                                    officeHolderName: mda.ministerName,
                                  ),
                                );
                              },
                              separatorBuilder: (context, int index) {
                                return Divider(
                                  color: Theme.of(context).hintColor.withOpacity(.6),
                                  thickness: 0.2,
                                );
                              },
                              itemCount: mdas.length,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              orElse: () => const Text("Something went wrong"));
        },
      ),
    );
  }
}
