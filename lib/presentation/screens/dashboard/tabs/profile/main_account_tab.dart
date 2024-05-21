


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:capp/core/constants/route_constants.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/widgets.dart';
import 'components/account_item_widget.dart';

class MainAccountTab extends StatefulWidget {
  const MainAccountTab({Key? key}) : super(key: key);

  @override
  _MainAccountTabState createState() => _MainAccountTabState();
}

class _MainAccountTabState extends State<MainAccountTab> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  String kyc = '', fullname = '';


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
  }


  // Future _refresh() {
  //   return ;
  // }

  logoutUser(){
    Get.offAllNamed(RouteConstants.login,);
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ThemeProvider>(
        builder: (context,theme, child)
    {
      return Material(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          color: Theme
              .of(context)
              .highlightColor,
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
                    top: size.height * .05, bottom: size.height * .2,),
                  child: Column(
                    children: [
                      // SizedBox(height: size.height * .04,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Profile",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            const SizedBox(height: 20,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FullNameInitialsWidget(color: Theme.of(context).highlightColor,
                                    fullname:
                                    'Jide Azeez'
                                ),
                                const SizedBox(height: 10,),
                                const Text(
                                  'Jide Azeez',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(6),
                                //     color: Theme.of(context).highlightColor.withOpacity(.5)
                                //   ),
                                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                                //   child: Text('Beginner',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 11,
                                //     fontWeight: FontWeight.w300
                                //   ),),
                                // )
                              ],
                            ),
                            SizedBox(height: size.height * .045,),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                AccountItemWidget("Profile Info",
                                      () {
                                  },
                                  const Color(0xFFE8C229),

                                    const Icon(
                                      Icons.person,
                                      color: Color(0xFFED1C00),
                                    )
                                ),
                                AccountItemWidget( "Wallet",
                                      () {
                                    Get.toNamed(RouteConstants.wallet);
                                  },
                                  const Color(0xFF6FBE45),

                                  const Icon(
                                    Icons.wallet,
                                    color: Color(0xFF6FBE45),
                                  ),
                                ),
                                AccountItemWidget("Password Settings",
                                      () {
                                  },
                                  const Color(0xFF31B7A9),

                                  const Icon(
                                    Icons.password_sharp,
                                    color: Color(0xFF31B7A9),
                                  ),
                                ),

                                AccountItemWidget("Refer and Earn",
                                      () {
                                  },
                                  const Color(0xFFF4A51D),

                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFF4A51D),
                                  ),
                                ),

                              ],
                            ),
                          ),


                          SizedBox(height: size.height * .015,),
                          Divider(
                            color: Theme
                                .of(context)
                                .hintColor
                                .withOpacity(.6),
                            thickness: 0.2,
                          ),
                          SizedBox(height: size.height * .03,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: AccountItemWidget("Log out",
                                  () {
                              logoutUser();
                              },
                              Colors.redAccent,

                              const Icon(
                                Icons.logout_rounded,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const VersionTextWidget(),
                          const SizedBox(
                            height: 10,
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



