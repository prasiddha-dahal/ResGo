import 'package:dio/dio.dart';
import 'package:resgo/core/api/error/app_error.dart';

/// Converts any exception into our unified AppError.
/// 
/// This is the ONLY place that knows about DioException, SocketException, etc.
/// Repositories just call this and get a clean AppError.

class ErrorHandler {
  static AppError handle(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    }

    return AppError(message: error.toString());
  }

  static AppError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const AppError(message: 'Connection timeout. Please try again.');

      case DioExceptionType.connectionError:
        return const AppError(message: 'No internet connection.');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        // Try to extract message from backend
        String message = 'Something went wrong';
        if (data is Map && data['message'] != null) {
          message = data['message'].toString();
        }

        return AppError(message: message, statusCode: statusCode);

      case DioExceptionType.cancel:
        return const AppError(message: 'Request cancelled');

      default:
        return AppError(message: error.message ?? 'Unexpected error occurred');
    }
  }
}