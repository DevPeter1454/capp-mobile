import 'package:capp/src/data_source/di/injection_container.dart';
import 'package:capp/src/domain/model/political_party_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/read_all_info_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/donation_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/join_party_user_detail_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/cubit/political_party_cubit.dart';
import 'package:capp/src/presentation/screens/search/search_result_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
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

class JoinPartyScreen extends StatefulWidget {
  const JoinPartyScreen({super.key});

  @override
  State<JoinPartyScreen> createState() => _JoinPartyScreenState();
}

class _JoinPartyScreenState extends State<JoinPartyScreen> {
  final _searchController = TextEditingController();

  final _politicalPartyCubit = getIt.get<PoliticalPartyCubit>();

  String extractAcronym(String input) {
    if (input == "Accord") {
      return 'Accord';
    }
    // Find the last occurrence of the dash "-"
    int dashIndex = input.lastIndexOf('-');

    // Extract the substring starting from one character after the dash
    if (dashIndex != -1 && dashIndex + 1 < input.length) {
      return input.substring(dashIndex + 2).trim();
    }

    // Return an empty string if the dash is not found
    return '';
  }

  Future<void> getPoliticalParties() async {
    final response = await _politicalPartyCubit.getPoliticalParties();
    print("response from screen $response");
  }

  @override
  void initState() {
    super.initState();
    getPoliticalParties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PoliticalPartyCubit, PoliticalPartyState>(
        bloc: _politicalPartyCubit,
        listener: (context, state) {
          state.maybeWhen(
              loading: () {
                context.showLoadingDialog();
              },
              error: (message) {
                context.hideLoadingDialog();
                context.showSnackBar(message);
              },
              loaded: (parties) {
                // context.hideLoadingDialog();
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeWhen(
              loading: () => const Center(
                    child: SpinKitCubeGrid(color: AppColors.primary, size: 50.0),
                  ),
              loaded: (parties) {
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
                                  'assets/images/ic_join_a_party.png',
                                  height: 32,
                                  width: 32,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Join a Political  Party',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Know important information about political parties in Nigeria',
                              style: TextStyle(
                                color: AppColors.descText,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 10),
                              child: SizedBox(
                                width: context.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CappCustomFormField(
                                    hintText: 'Search by political party name...',
                                    hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
                                    onFieldSubmitted: (value) {
                                      value.isNotEmpty ? Get.to(() => const SearchResultScreen()) : 'Please field cannot be empty';
                                    },
                                    onChanged: (val) {},
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    keyboardType: TextInputType.text,
                                    fillColor: const Color(0XFFF4F4F6),
                                    borderColor: Colors.transparent,
                                    radius: 8.r,
                                    isValidated: _searchController.text.isNotEmpty,
                                    validator: (value) => value!.isNotEmpty ? null : 'Please field cannot be empty',
                                    prefixIcon: const Icon(CupertinoIcons.search),
                                    controller: _searchController,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: context.heightPercentage(.02),
                            ),
                            SizedBox(
                              height: context.height,
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, int index) {
                                  final party = parties[index];
                                  return CustomListCard(
                                    title: party.name,
                                    isKnowMDA: false,
                                    politicalPartyImageUrl: party.logo,
                                    onClickedPrimaryActionButton: () {
                                      return showModalBottomSheet(
                                        context: context,
                                        useSafeArea: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                        ),
                                        builder: (context) {
                                          return CappCustomBottomSheet(
                                            isShareIcon: false,
                                            partyDetails: party.description,
                                            onClickedContinueReading: () =>
                                                Get.to(() => ReadAllInfoScreen(title: party.name, content: party.description)),
                                            politicalPartyLogo: party.logo,
                                            politicalPartyName: party.name,
                                            onClickedSecondaryActionButton: () {
                                              Get.to(() => DonationScreen(id: party.id));
                                            },
                                            onClickedPrimaryActionButton: () {
                                              Get.to(() => JoinPartyUserSignUpScreen(id: party.id));
                                            },
                                            title: 'View Details',
                                            acrocymn: extractAcronym(party.name),
                                          );
                                        },
                                      );
                                    },
                                    acroymn: extractAcronym(party.name),
                                    isIconLeft: false,
                                  );
                                },
                                separatorBuilder: (context, int index) {
                                  return Divider(
                                    color: Theme.of(context).hintColor.withOpacity(.6),
                                    thickness: 0.2,
                                  );
                                },
                                itemCount: parties.length,
                              ),
                            ),
                            SizedBox(
                              height: context.heightPercentage(.04),
                            )
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
