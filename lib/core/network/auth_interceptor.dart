import 'package:dio/dio.dart';
import 'package:resgo/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Automatically attaches the Bearer token to every request.
/// 
/// Screens and repositories never manually add the token.

class AuthInterceptor extends Interceptor {
  final Future<SharedPreferences> prefsFuture;

  AuthInterceptor(this.prefsFuture);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await prefsFuture;
    final token = prefs.getString(StorageKeys.authToken);

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}