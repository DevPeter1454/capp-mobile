import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';


///
/// This class extends [Equatable] and implements [Exception].
/// It contains a [message] and a [statusCode] property.
/// The [message] property contains the error message and the [statusCode]
/// property contains the HTTP status code of the response.
///
/// This class has a constructor [fromDioError] which takes a [DioException]
/// as a parameter and sets the [statusCode] and [message] properties based on
/// the type of the [DioException].
///
/// This class also overrides the [props] getter from [Equatable] to compare
/// instances of this class based on the [message] and [statusCode] properties.
///
/// Example usage:
/// ```dart
/// try {
///   // some network request
/// } on DioException catch (e) {
///   throw NetworkException.fromDioError(e);
/// }
/// ```
class NetworkException extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
      switch (statusCode){
        case 409:
        case 401:
        message = 'Authorization error';
        case 404:
        message = 'Resource not found';
        case 500:
        message  = 'Internal server  error';
        case 400:
        if (dioException.response?.data is Map<String, dynamic>) {
          final data = dioException.response!.data as Map<String, dynamic>;
          if (data.containsKey('error_msg')) {
            message = data['error_msg'].toString();
          } else {
            message = data.toString();
          }
        } else {
          message = dioException.response!.data.toString();
        }
        
      }
      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}