import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/product/presentation/providers/product_controller.dart';
import 'package:resgo/features/product/presentation/widgets/product_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(productControllerProvider);

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
      body: homeAsync.when(
        loading: () => Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: AppColors.primary,
            size: AppDimensions.iconLg,
          ),
        ),

        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: AppDimensions.md),
                ElevatedButton(
                  onPressed: () {
                    ref.read(productControllerProvider.notifier).refresh();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (state) {
          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () =>
                ref.read(productControllerProvider.notifier).refresh(),
            child: ListView(
              padding: const EdgeInsets.all(AppDimensions.md),
              children: [
                // Featured
                if (state.featuredProducts.isNotEmpty) ...[
                  Text('Featured', style: AppTextStyles.heading2),
                  const SizedBox(height: AppDimensions.md),
                  SizedBox(
                    height: 230,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.featuredProducts.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppDimensions.sm),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: state.featuredProducts[index],
                          width: 160,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppDimensions.lg),
                ],

                // All Products
                Text('All Products', style: AppTextStyles.heading2),
                const SizedBox(height: AppDimensions.md),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppDimensions.sm + 4,
                    crossAxisSpacing: AppDimensions.sm + 4,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
