import 'package:dio/dio.dart';
import 'package:resgo/core/api/error/app_error.dart';
import 'package:resgo/core/api/error/error_handler.dart';
import 'package:resgo/core/network/network_info.dart';

/// Base class that every remote data source / repository implementation extends.
/// 
/// Responsibilities:
/// 1. Check internet before making request
/// 2. Call Dio
/// 3. Convert any error into AppError
/// 4. Return clean data or throw AppError
/// 
/// This is the exact pattern used in PhysioGhar.

abstract class BaseRemoteSource {
  final Dio dio;
  final NetworkInfo networkInfo;

  BaseRemoteSource({
    required this.dio,
    required this.networkInfo,
  });

  /// Helper that wraps any API call with connectivity check + error handling.
  Future<T> callApi<T>(Future<T> Function() apiCall) async {
    final isConnected = await networkInfo.isConnected;

    if (!isConnected) {
      throw const AppError(message: 'No internet connection');
    }

    try {
      return await apiCall();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }
}