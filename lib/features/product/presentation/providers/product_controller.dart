import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/features/product/data/models/category/category.dart';
import 'package:resgo/features/product/data/models/product/product.dart';
import 'package:resgo/features/product/presentation/providers/product_provider.dart';

/// All products
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final result = await ref.read(productRepositoryProvider).getProducts();

  return result.fold(
    (error) => throw error,
    (response) => response.data,
  );
});

/// Featured products
final featuredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final result =
      await ref.read(productRepositoryProvider).getFeaturedProducts();

  return result.fold(
    (error) => throw error,
    (response) => response.data,
  );
});

/// Product categories
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final result = await ref.read(productRepositoryProvider).getCategories();

  return result.fold(
    (error) => throw error,
    (response) => response.data,
  );
});

/// Single product details
final productDetailProvider = FutureProvider.family<Product, int>((
  ref,
  id,
) async {
  final result = await ref.read(productRepositoryProvider).getProductById(id);

  return result.fold(
    (error) => throw error,
    (product) => product,
  );
});