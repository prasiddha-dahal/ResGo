import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/product/presentation/providers/product_controller.dart';
import 'package:resgo/features/product/presentation/widgets/product_card.dart';
import 'package:resgo/features/product/presentation/widgets/product_grid_loading.dart';
import 'package:resgo/features/product/presentation/widgets/section_error.dart';
import 'package:resgo/features/product/presentation/widgets/section_loading.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final featuredAsync = ref.watch(featuredProductsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Home', style: AppTextStyles.heading3),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            color: AppColors.textPrimary,
            onPressed: () => context.push(AppRoutes.cart),
          ),
        ],
      ),

      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () async {
          ref.invalidate(productsProvider);
          ref.invalidate(featuredProductsProvider);
          ref.invalidate(categoriesProvider);

          await Future.wait([
            ref.read(productsProvider.future),
            ref.read(featuredProductsProvider.future),
            ref.read(categoriesProvider.future),
          ]);
        },

        child: ListView(
          padding: const EdgeInsets.only(
            top: AppDimensions.md,
            bottom: AppDimensions.xl,
          ),
          children: [
            // ------------------------------------------------------------
            // Categories
            // ------------------------------------------------------------
            categoriesAsync.when(
              loading: () => const SectionLoading(),

              error: (error, _) =>
                  const SectionError(message: 'Unable to load categories'),

              data: (categories) {
                if (categories.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.md,
                      ),
                      child: Text('Categories', style: AppTextStyles.heading2),
                    ),

                    const SizedBox(height: AppDimensions.md),

                    SizedBox(
                      height: 44,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.md,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: AppDimensions.sm),
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.md,
                              vertical: AppDimensions.sm,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                category.title,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: AppDimensions.lg),

            // ------------------------------------------------------------
            // Featured Products
            // ------------------------------------------------------------
            featuredAsync.when(
              loading: () => const SectionLoading(),

              error: (error, _) => const SectionError(
                message: 'Unable to load featured products',
              ),

              data: (products) {
                if (products.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.md,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Featured', style: AppTextStyles.heading2),

                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to all featured products
                            },
                            child: Text(
                              'See all',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppDimensions.sm),

                    CarouselSlider.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index, realIndex) {
                        final product = products[index];

                        return GestureDetector(
                          onTap: () => context.pushNamed(
                            'productDetail',
                            pathParameters: {'id': product.id.toString()},
                          ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.xs,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusLg,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusLg,
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  // Product image
                                  CachedNetworkImage(
                                    imageUrl: product.image,
                                    fit: BoxFit.cover,

                                    placeholder: (_, __) => Container(
                                      color: AppColors.border,
                                      child: SectionLoading(),
                                    ),

                                    errorWidget: (_, __, ___) => Container(
                                      color: AppColors.border,
                                      child: const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 40,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ),

                                  // Bottom gradient
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                        AppDimensions.md,
                                        40,
                                        AppDimensions.md,
                                        AppDimensions.md,
                                      ),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black87,
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            product.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles.heading3
                                                .copyWith(color: Colors.white),
                                          ),

                                          const SizedBox(height: 4),

                                          Text(
                                            'Rs. ${product.discountPrice.toStringAsFixed(0)}',
                                            style: AppTextStyles.price.copyWith(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // Discount badge
                                  if (product.discountAmount > 0)
                                    Positioned(
                                      top: AppDimensions.md,
                                      left: AppDimensions.md,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.error,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Text(
                                          product.discountPercent,
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },

                      options: CarouselOptions(
                        height: 260,
                        viewportFraction: 0.78,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.12,
                        autoPlay: products.length > 1,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        enableInfiniteScroll: products.length > 1,
                        padEnds: true,
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: AppDimensions.xl),

            // ------------------------------------------------------------
            // All Products
            // ------------------------------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.md),
              child: Text('All Products', style: AppTextStyles.heading2),
            ),

            const SizedBox(height: AppDimensions.md),

            productsAsync.when(
              loading: () => const ProductGridLoading(),

              error: (error, _) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.md,
                ),
                child: SectionError(
                  message: 'Unable to load products',
                  onRetry: () {
                    ref.invalidate(productsProvider);
                  },
                ),
              ),

              data: (products) {
                if (products.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(AppDimensions.lg),
                    child: Center(child: Text('No products available')),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.md,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppDimensions.sm + 4,
                          crossAxisSpacing: AppDimensions.sm + 4,
                          childAspectRatio: 0.55,
                        ),
                    itemBuilder: (context, index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
