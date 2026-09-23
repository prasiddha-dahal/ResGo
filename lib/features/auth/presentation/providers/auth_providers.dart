import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:resgo/features/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final sessionService = ref.watch(sessionServiceProvider).requireValue;
  final dio = ref.watch(dioProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return AuthRepositoryImpl(
    sessionService: sessionService,
    dio: dio,
    networkInfo: networkInfo,
  );
});
