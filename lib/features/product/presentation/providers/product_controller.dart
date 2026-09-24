import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/features/product/data/models/category/category.dart';
import 'package:resgo/features/product/data/models/product/product.dart';
import 'package:resgo/features/product/presentation/providers/product_provider.dart';

class ProductState {
  final List<Product> products;
  final List<Product> featuredProducts;
  final List<Category> categories;
  final Product? selectedProduct;

  const ProductState({
    this.products = const [],
    this.featuredProducts = const [],
    this.categories = const [],
    this.selectedProduct,
  });

  ProductState copyWith({
    List<Product>? products,
    List<Product>? featuredProducts,
    List<Category>? categories,
    Product? selectedProduct,
  }) {
    return ProductState(
      products: products ?? this.products,
      featuredProducts: featuredProducts ?? this.featuredProducts,
      categories: categories ?? this.categories,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }
}

class ProductController extends AsyncNotifier<ProductState> {
  @override
  Future<ProductState> build() async {
    return _fetchHomeData();
  }

  Future<ProductState> _fetchHomeData() async {
    final repo = ref.read(productRepositoryProvider);

    final results = await (
      repo.getProducts(),
      repo.getFeaturedProducts(),
      repo.getCategories(),
    ).wait;

    final products = results.$1.fold((e) => throw e, (r) => r.data);
    final featured = results.$2.fold((e) => throw e, (r) => r.data);
    final categories = results.$3.fold((e) => throw e, (r) => r.data);

    return ProductState(
      products: products,
      featuredProducts: featured,
      categories: categories,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchHomeData);
  }
}

final productControllerProvider =
    AsyncNotifierProvider<ProductController, ProductState>(
      ProductController.new,
    );

final productDetailProvider = FutureProvider.family<Product, int>((
  ref,
  id,
) async {
  final result = await ref.read(productRepositoryProvider).getProductById(id);

  return result.fold((error) => throw error, (product) => product);
});
