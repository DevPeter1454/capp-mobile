// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

enum ConnectivityStatus { Online, Offline }

@lazySingleton
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<ConnectivityStatus> hasNetworkConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if(connectivityResult != ConnectivityResult.none){
      ConnectivityStatus status = await checkStatus();

      return status;
    }
    return ConnectivityStatus.Offline;
  }

  Stream<ConnectivityStatus> get networkStatusStream => _connectivity.onConnectivityChanged.asyncMap(
          (connectivityResult) async {
        if (connectivityResult != ConnectivityResult.none) {
          return await checkStatus();
        } else {
          return ConnectivityStatus.Offline;
        }
      });

  Future<ConnectivityStatus> checkStatus() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    return isOnline ? ConnectivityStatus.Online : ConnectivityStatus.Offline;
  }
}