import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:capp/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../widgets/widgets.dart';

class MainWalletTab extends StatefulWidget {
  const MainWalletTab({Key? key}) : super(key: key);

  @override
  _MainWalletTabState createState() => _MainWalletTabState();
}

class _MainWalletTabState extends State<MainWalletTab> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String kyc = '', fullname = '';
  int selectedCoinIndex = 0;
  late String selectedFilter ;
  List<String> filterList = ['All', 'Main Wallet', 'Escrow Wallet', 'Referral Wallet'];
  Map<String, Color> coinList = {'Main': AppColors.primary, 'Escrow' : AppColors.primary, 'Referral' :AppColors.appBlue};

  @override
  void initState() {
    super.initState();
    selectedFilter = filterList[0];
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // progressDialog = new ProgressDialog(scaffoldKey.currentContext,
      //     type: ProgressDialogType.Normal, isDismissible: false);
    });
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
              child: Column(
                children: [
                  // SizedBox(height: size.height * .04,),
                  const SizedBox(height: 10),
                  BackArrowWidget(onTap: () {
                    Get.back();
                  },),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [

                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Wallet",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Center(
                              child: Padding(
                                padding:  const EdgeInsets.only(
                                    bottom: 5, top: 10),
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 220,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,

                                    // aspectRatio: 16 / 14,
                                    initialPage: 1,
                                    // viewportFraction: 1.0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: false,
                                    autoPlayInterval: const Duration(seconds: 3),
                                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        selectedCoinIndex = index;
                                      });
                                    },
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: coinList
                                      .entries
                                      .map(
                                        (e) => ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: WalletBalWidget(
                                          onLeftBtnClicked: () {

                                            },
                                          isCrypto: true,
                                          onRightBtnClicked: () {

                                          },
                                          color: e.value,
                                          leftBtnPaddingVertical: 12,
                                          rightBtnPaddingVertical: 12,
                                          rightBtnState:true,
                                          leftBtnState: true,
                                          currentBal: '20000.00',
                                          rightText: 'Top up',
                                          walletType: e.key,
                                          leftText: 'Withdraw',

                                        )
                                    ),
                                  )
                                      .toList(),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10, top: 15),
                                child: Container(
                                  child: AnimatedSmoothIndicator(
                                    activeIndex: selectedCoinIndex,
                                    count: 3,
                                    // count: 2,
                                    effect:  ExpandingDotsEffect(
                                      dotHeight: 10,
                                      radius: 20,
                                      dotWidth: 10,
                                      activeDotColor: Theme.of(context).highlightColor,
                                      dotColor: Theme.of(context).highlightColor.withOpacity(.2),
                                      expansionFactor: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          color:Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26),),
                          // shape: BoxShape.circle,

                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).hintColor.withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        height: size.height * .5,
                        padding: const EdgeInsets.symmetric( vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20,),
                                child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Transactions',
                                    style: TextStyle(fontWeight: FontWeight.w700,
                                    fontSize: 15),),

                                    Text('View all',
                                      style: TextStyle(fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.underline,
                                          fontSize: 12),),
                                  ],
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                child: CappCustomDropDown(
                                  selectedItem: selectedFilter,
                                  dropDownList: filterList,
                                  isValidated: selectedFilter != null,
                                  hintText: 'Select Type',
                                  onValueChanged: (value) {
                                    setState(() {
                                      selectedFilter = value.toString();
                                    });
                                  },
                                  width: size.width,
                                ),
                              ),

                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WalletTransactionItemWidget(isInflow: true,),
                                    WalletTransactionItemWidget(),
                                    WalletTransactionItemWidget(isInflow: true,),
                                    WalletTransactionItemWidget(),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * .12,)
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

