import 'dart:io';

import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final SharedPreferencesService sharedPrefs;

  Dio get _dioClient => Dio(_baseOptions);

  DioClient(this.sharedPrefs);

  BaseOptions get _baseOptions {
    final String accessToken = sharedPrefs.authToken ?? '';
    // print('user token is $accessToken');
    return BaseOptions(
        // connectTimeout: const Duration(minutes: 1),
        // receiveTimeout: const Duration(minutes: 1),
        contentType: 'application/json',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          if (accessToken.isNotEmpty)
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        });
  }

  Future<Response<dynamic>> _makeRequest(
      Future<Response<dynamic>> Function() dioRequest) async {
    try {
      return await dioRequest.call();
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  Future<Response<dynamic>> dioPost(url, data, {Options? options}) {
    return _makeRequest(
        () => _dioClient.post(url, data: data, options: options));
  }

  Future<Response<dynamic>> dioGet(url, {Options? options}) {
    return _makeRequest(() => _dioClient.get(url, options: options));
  }

  Future<Response<dynamic>> dioPut(url, data, {Options? options}) {
    return _makeRequest(
        () => _dioClient.put(url, data: data, options: options));
  }

  Future<Response<dynamic>> dioDelete(url, {Options? options}) {
    return _makeRequest(() => _dioClient.delete(url, options: options));
  }

  Future<Response<dynamic>> dioPatch(url, data, {Options? options}) {
    return _makeRequest(
        () => _dioClient.patch(url, data: data, options: options));
  }
}
