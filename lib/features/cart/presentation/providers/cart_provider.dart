import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:resgo/features/cart/domain/repositories/cart_repository.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl(
    dio: ref.watch(dioProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});
