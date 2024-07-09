import 'dart:async';

import 'package:capp/src/handlers/dialog_manager.dart';
import 'package:capp/src/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'src/constants/route_constants.dart';
import 'src/data_source/di/injection_container.dart';
import 'src/data_source/network/connectivity.dart';
import 'src/providers/theme_provider.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  // final sessionStateStream = StreamController<SessionState>();
  String routeName = '/';

  var duration = 400;
  StreamSubscription<ConnectivityStatus>? networkSubscription;

  void startListeningToNetworkChanges() {
    networkSubscription =
        locator<ConnectivityService>().networkStatusStream.listen((status) {
      // if (status == ConnectivityStatus.Online) {
      //   CustomDialogWidgets.buildSuccessSnackbar('Internet access restored');
      // } else if (status == ConnectivityStatus.Offline) {
      //   CustomDialogWidgets.buildErrorSnackbar('No internet connection');
      // }
    });
  }

  void stopListening() {
    if (networkSubscription != null) {
      networkSubscription?.cancel();
    }
  }

  @override
  initState() {
    super.initState();
    startListeningToNetworkChanges();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(seconds: 5), () {});
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (ctx, themeProvider, _) {
        return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onPanDown: (_) {
              FocusScope.of(context).unfocus();
            },
            child: GetMaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              enableLog: true,
              initialRoute: RouteConstants.initialPage,
              getPages: RouteGenerator.routes,
              // themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              // darkTheme: MyThemes.darkTheme,
              scaffoldMessengerKey: scaffoldMessengerKey,
              builder: (context, child) {
                return Navigator(
                  onGenerateRoute: (settings) => CupertinoPageRoute(
                    builder: (context) => DialogManager(
                      child: child!,
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}

// This widget is the root of your application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
