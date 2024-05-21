import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:capp/core/di/injection_container.dart';

import 'interceptor.dart';


 class BaseApiClient {
  final Dio _dio = locator<Dio>();
  BaseApiClient() {
    _dio.interceptors.add(DioLoggerInterceptor());
    _dio.options.followRedirects = true;
    _dio.options.maxRedirects = 4;
  }

  Future<void> setBearerToken(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    _dio.options.followRedirects = true;
  }

  void clearBearerToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<Response> get(
      String url, {
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
        Function(int progress, int total)? progress,
      }) async {
    Response? response;
    try {
      response = await _dio.get(
        url,
        queryParameters: params,
        options: options,
        cancelToken: token,
        onReceiveProgress: progress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> post(
      String url, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
        Function(int progress, int total)? sendProgress,
        Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.post(
        url,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
        onReceiveProgress: receiveProgress,
        onSendProgress: sendProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> put(
      String url, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
        Function(int progress, int total)? sendProgress,
        Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.put(
        url,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
        onReceiveProgress: receiveProgress,
        onSendProgress: sendProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> patch(
      String url, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
        Function(int progress, int total)? sendProgress,
        Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.patch(
        url,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
        onReceiveProgress: receiveProgress,
        onSendProgress: sendProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> delete(
      String url, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
      }) async {
    Response? response;
    try {
      response = await _dio.delete(
        url,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
      );
      return response;
    }on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> download(
      String url,
      dynamic savePath, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
        Function(int progress, int total)? receiveProgress,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader,
      }) async {
    Response? response;
    try {
      response = await _dio.download(
        url,
        savePath,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
        onReceiveProgress: receiveProgress,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> head(
      String url, {
        dynamic data,
        Map<String, dynamic>? params,
        Options? options,
        CancelToken? token,
      }) async {
    Response? response;
    try {
      response = await _dio.head(
        url,
        data: data,
        queryParameters: params,
        options: options,
        cancelToken: token,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> fetch(RequestOptions requestOptions) async {
    Response? response;
    try {
      response = await _dio.fetch(requestOptions);
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> getUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.getUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: receiveProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> headUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.headUri(
        uri,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> postUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? sendProgress,
        void Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.postUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> putUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? sendProgress,
        void Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.putUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> patchUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? sendProgress,
        void Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.patchUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: sendProgress,
        onReceiveProgress: receiveProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> deleteUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? sendProgress,
        void Function(int progress, int total)? receiveProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.deleteUri(
        uri,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> downloadUri(Uri uri, dynamic savePath,
      {dynamic data,
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? receiveProgress,
        bool deleteOnError = true,
        String lengthHeader = Headers.contentLengthHeader}) async {
    Response? response;
    try {
      response = await _dio.downloadUri(
        uri,
        savePath,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: receiveProgress,
        data: data,
        deleteOnError: deleteOnError,
        lengthHeader: lengthHeader,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> request(
      String path, {
        dynamic data,
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? receiveProgress,
        void Function(int progress, int total)? sendProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.request(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: receiveProgress,
        onSendProgress: sendProgress,
      );
      return response;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Response> requestUri(
      Uri uri, {
        dynamic data,
        Options? options,
        CancelToken? cancelToken,
        void Function(int progress, int total)? receiveProgress,
        void Function(int progress, int total)? sendProgress,
      }) async {
    Response? response;
    try {
      response = await _dio.requestUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: receiveProgress,
        onSendProgress: sendProgress,
      );
      return response;
    }  on DioException catch (e) {
      log(e.toString());
      rethrow;

    }
  }
}
