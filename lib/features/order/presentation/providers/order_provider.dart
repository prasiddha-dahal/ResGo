import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/features/order/data/repositories/order_repository_impl.dart';

final orderRepositoryProvider = Provider<OrderRepositoryImpl>((ref) {
  final dio = ref.watch(dioProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return OrderRepositoryImpl(dio: dio, networkInfo: networkInfo);
});
