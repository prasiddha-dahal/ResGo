import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:resgo/core/network/auth_interceptor.dart';
import 'package:resgo/core/network/network_info.dart';
import 'package:resgo/core/session/session_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

/// ─────────────────────────────────────────────────────────────
/// CORE PROVIDERS
/// ─────────────────────────────────────────────────────────────
/// These are the shared building blocks of the entire app.
/// Every feature repository will depend on these.
///
/// Dependency flow:
/// ProviderScope
///   → dioProvider + networkInfoProvider + sessionServiceProvider
///     → Feature Repository Providers
///       → Feature Controllers
///         → Screens

const String kBaseUrl = 'https://ecommerce.codeitappsware.com/api';

/// Increments when user logs in/out so we can invalidate user-scoped state.
final sessionRevisionProvider = StateProvider<int>((ref) => 0);

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(InternetConnectionChecker.instance);
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Attach auth token automatically
  dio.interceptors.add(
    AuthInterceptor(ref.read(sharedPreferencesProvider.future)),
  );

  // Pretty logs only in debug mode
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );
  }

  ref.onDispose(() => dio.close());
  return dio;
});

final sessionServiceProvider = FutureProvider<SessionService>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return SessionService(prefs);
});

final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));