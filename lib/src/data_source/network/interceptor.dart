import 'package:dio/dio.dart';

class DioLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("--> ${options.method} ${options.uri}");
    print("Headers:");
    options.headers.forEach((key, value) {
      print("$key: $value");
    });
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print("<---------- END HTTP --------------------->");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    print("<-- ${response.statusCode} ${response.requestOptions.uri}");
    print("Headers:");
    response.headers.forEach((key, value) {
      print("$key: $value");
    });
    if (response.data != null) {
      print("Response: ${response.data}");
    }
    print("<---------- END HTTP --------------------->");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("<-- ${err.response?.statusCode} ${err.requestOptions.uri}");
    print("Error: ${err.message}");
    print("<---------- END HTTP --------------------->");
    super.onError(err, handler);
  }
}
