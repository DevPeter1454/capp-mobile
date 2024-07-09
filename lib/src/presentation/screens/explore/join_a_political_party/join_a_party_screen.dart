import 'package:capp/src/domain/model/political_party_model.dart';
import 'package:capp/src/presentation/screens/explore/civic_education/components/read_all_info_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/donation_screen.dart';
import 'package:capp/src/presentation/screens/explore/join_a_political_party/components/join_party_user_detail_screen.dart';
import 'package:capp/src/presentation/screens/search/search_result_screen.dart';
import 'package:capp/src/presentation/widgets/custom_ui/capp_custom_bottom_sheet.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_list_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinPartyScreen extends StatefulWidget {
  const JoinPartyScreen({super.key});

  @override
  State<JoinPartyScreen> createState() => _JoinPartyScreenState();
}

class _JoinPartyScreenState extends State<JoinPartyScreen> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                          onFieldSubmitted: (value) {
                            value.isNotEmpty
                                ? Get.to(() => const SearchResultScreen())
                                : 'Please field cannot be empty';
                          },
                          onChanged: (val) {},
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          keyboardType: TextInputType.text,
                          fillColor: AppColors.appGrey.withOpacity(.3),
                          radius: 8,
                          isValidated: _searchController.text.isNotEmpty,
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : 'Please field cannot be empty',
                          prefixIcon: Image.asset('assets/images/search.png',
                              height: 20, width: 20),
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
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, int index) {
                        List<PoliticalPartyModel> items = List.generate(
                            2, (index) => PoliticalPartyModel.forTest());
                        return CustomListCard(
                          title: items[index].name,
                          isKnowMDA: false,
                          politicalPartyImageUrl: items[index].imageUrl,
                          onClickedPrimaryActionButton: () {
                            return showModalBottomSheet(
                              context: context,
                              useSafeArea: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) {
                                return CappCustomBottomSheet(
                                  isShareIcon: false,
                                  partyDetails: items[index].content,
                                  onClickedContinueReading: () => Get.to(() =>
                                      ReadAllInfoScreen(
                                          title: items[index].name,
                                          content: items[index].content ?? '')),
                                  countPartyLeader:
                                      items[index].partyLeaders.length,
                                  namePartyLeader:
                                      items[index].partyLeaders[index].name,
                                  partyLeaderImageUrl:
                                      items[index].partyLeaders[index].imageUrl,
                                  politicalPartyLogo: items[index].imageUrl,
                                  politicalPartyName: items[index].name,
                                  onClickedSecondaryActionButton: () {
                                    Get.to(() => const DonationScreen());
                                  },
                                  onClickedPrimaryActionButton: () {
                                    Get.to(() =>
                                        const JoinPartyUserSignUpScreen());
                                  },
                                  title: 'View Details',
                                  acrocymn: items[index].acrocymn,
                                );
                              },
                            );
                          },
                          acroymn: items[index].acrocymn,
                          isIconLeft: false,
                        );
                      },
                      separatorBuilder: (context, int index) {
                        return Divider(
                          color: Theme.of(context).hintColor.withOpacity(.6),
                          thickness: 0.2,
                        );
                      },
                      itemCount: 2,
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
      ),
    );
  }
}
