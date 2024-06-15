import 'package:capp/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainMyOrdersTab extends StatefulWidget {
  const MainMyOrdersTab({Key? key}) : super(key: key);

  @override
  _MainMyOrdersTabState createState() => _MainMyOrdersTabState();
}

class _MainMyOrdersTabState extends State<MainMyOrdersTab> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {});
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
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * .05,
                  // bottom: size.height * .2,
                ),
                child: const Column(
                  children: [
                    // SizedBox(height: size.height * .04,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("My Orders",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
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
