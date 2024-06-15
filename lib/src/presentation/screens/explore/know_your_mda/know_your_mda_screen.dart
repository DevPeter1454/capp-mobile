import 'package:capp/src/domain/model/politcal_party_model.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_list_card.dart';
import 'package:capp/src/presentation/widgets/custom_ui/custom_top_navbar.dart';
import 'package:capp/src/presentation/widgets/widgets.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class KnowYourMDA extends StatefulWidget {
  const KnowYourMDA({super.key});

  @override
  State<KnowYourMDA> createState() => _KnowYourMDAState();
}

class _KnowYourMDAState extends State<KnowYourMDA> {
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
                  children: [
                    const CustomTopNavBar(title: "Back to home"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/ic_know_your_mda.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Know your MDA\'s',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
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
                            hintText:
                                'Search by Ministry, Department or agency',
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
                      height: context.height,
                      child: ListView.separated(
                        itemBuilder: (context, int index) {
                          List<PoliticalPartyModel> items = List.generate(
                              6, (index) => PoliticalPartyModel.forTest());
                          return const CustomListCard(
                            title:
                                'Federal Ministry of Agriculture and Food Security',
                            isKnowMDA: true,
                            mdaImageUrl: 'assets/images/ministry.png',
                            officeHolderName: 'Adedayo Adelabu',
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
