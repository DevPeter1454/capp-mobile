import 'package:capp/src/domain/model/politcal_party_model.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_list_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class KnowYourLeader extends StatefulWidget {
  const KnowYourLeader({super.key});

  @override
  State<KnowYourLeader> createState() => _KnowYourLeaderState();
}

class _KnowYourLeaderState extends State<KnowYourLeader> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
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
                        Image.asset('assets/images/ic_know_your_leaders.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Know your Leader',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Get to know more about your leaders',
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
                            hintText: 'Search by Leaders name...',
                            onChanged: (val) {},
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            keyboardType: TextInputType.text,
                            fillColor: theme.isDarkMode
                                ? Colors.grey[800]
                                : AppColors.appGrey.withOpacity(.3),
                            radius: 8,
                            prefixIcon: Image.asset('assets/images/search.png'),
                            controller: _searchController,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: context.height * .56,
                      child: ListView.separated(
                        itemBuilder: (context, int index) {
                          List<PoliticalPartyModel> items = List.generate(
                              6, (index) => PoliticalPartyModel.forTest());
                          return const CustomListCard(
                            title: 'Bola Ahmed Tinubu',
                            isKnowMDA: false,
                            ctnWidth: 60,
                            ctnheight: 60,
                            politicalPartyImageUrl:
                                'assets/images/president.png',
                            officeHolderName: 'President',
                          );
                        },
                        separatorBuilder: (context, int index) {
                          return Divider(
                            color: Theme.of(context).hintColor.withOpacity(.6),
                            thickness: 0.2,
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
