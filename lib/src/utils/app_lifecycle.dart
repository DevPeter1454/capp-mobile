import 'package:capp/src/constants/route_constants.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLifecycleService with WidgetsBindingObserver {
  final SharedPreferencesService sharedPrefs;
  final bool isForgotPassword;

  AppLifecycleService(this.sharedPrefs, {required this.isForgotPassword});

  void startObserving() {
    WidgetsBinding.instance.addObserver(this);
  }

  void stopObserving() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.hidden && isForgotPassword) {
      // App is in the background and forgot password is true
      await sharedPrefs.clear();
      Get.offNamedUntil(
          RouteConstants.forgotPassword, ModalRoute.withName('/welcome'));
    } else if (state == AppLifecycleState.inactive && isForgotPassword) {
      await sharedPrefs.clear();
    }
  }
}
