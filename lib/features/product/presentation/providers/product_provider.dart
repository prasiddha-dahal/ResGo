import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/features/product/data/repositories/product_repository_impl.dart';

final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  final dio = ref.watch(dioProvider);
  final networkInfo = ref.watch(networkInfoProvider);
  return ProductRepositoryImpl(dio: dio, networkInfo: networkInfo);
});
