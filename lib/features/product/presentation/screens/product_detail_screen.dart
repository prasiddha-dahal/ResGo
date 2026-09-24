import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/features/product/presentation/providers/product_controller.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: productAsync.when(
          data: (product) => Text(
            product.title,
            style: AppTextStyles.heading3,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          loading: () => Text('Loading...', style: AppTextStyles.heading3),
          error: (_, __) => Text('Product', style: AppTextStyles.heading3),
        ),
      ),
      body: productAsync.when(
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
                  onPressed: () =>
                      ref.invalidate(productDetailProvider(productId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (product) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                CachedNetworkImage(
                  imageUrl: product.image!,
                  width: double.infinity,
                  height: 320,
                  fit: BoxFit.cover,
                  placeholder: (_, __) =>
                      Container(height: 320, color: AppColors.border),
                ),

                Padding(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title, style: AppTextStyles.heading2),
                      const SizedBox(height: AppDimensions.sm),

                      if (product.category != null)
                        Text(product.category!, style: AppTextStyles.bodySmall),

                      const SizedBox(height: AppDimensions.md),

                      // Price
                      Row(
                        children: [
                          Text(
                            'Rs. ${product.discountPrice ?? product.price}',
                            style: AppTextStyles.price,
                          ),
                          if (product.discountAmount != null &&
                              product.discountAmount > 0) ...[
                            const SizedBox(width: AppDimensions.sm),
                            Text(
                              'Rs. ${product.price}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: AppDimensions.xl),

                      Text('Description', style: AppTextStyles.heading3),
                      const SizedBox(height: AppDimensions.sm),
                      Text(
                        _stripHtml(product.description ?? ''),
                        style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
                      ),

                      const SizedBox(height: AppDimensions.xxl),

                      // Add to Cart button (placeholder)
                      SizedBox(
                        width: double.infinity,
                        height: AppDimensions.buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: add to cart
                          },
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
}
