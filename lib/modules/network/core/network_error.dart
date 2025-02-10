import 'package:dio/dio.dart';

class NetworkError implements Exception {
  late String message;
  late int? statusCode;
  late dynamic error;

  NetworkError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        statusCode = dioError.response?.statusCode;
        break;
      case DioExceptionType.unknown:
        if (dioError.error.toString().contains('SocketException')) {
          message = 'No Internet connection';
          break;
        }
        message = 'Unexpected error occurred';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
    error = dioError.error;
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
