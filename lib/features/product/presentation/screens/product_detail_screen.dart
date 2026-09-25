import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/cart/presentation/providers/cart_controller.dart';
import 'package:resgo/features/product/presentation/providers/product_controller.dart';
import 'package:resgo/features/product/presentation/widgets/section_error.dart';
import 'package:resgo/features/product/presentation/widgets/section_loading.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productDetailProvider(widget.productId));

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text('Product Details', style: AppTextStyles.heading3),
      ),

      body: productAsync.when(
        loading: () => Center(child: SectionLoading()),

        error: (error, _) => SectionError(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(productDetailProvider(widget.productId));
          },
        ),

        data: (product) {
          final hasDiscount =
              product.discountAmount > 0 &&
              product.discountPrice < product.price;

          return CustomScrollView(
            slivers: [
              // ----------------------------------------------------------
              // Product Image
              // ----------------------------------------------------------
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.image,
                      width: double.infinity,
                      height: 330,
                      fit: BoxFit.cover,

                      placeholder: (_, __) => Container(
                        height: 330,
                        color: AppColors.border,
                        child: Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.primary,
                            size: AppDimensions.iconLg,
                          ),
                        ),
                      ),

                      errorWidget: (_, __, ___) => Container(
                        height: 330,
                        color: AppColors.border,
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                        ),
                      ),
                    ),

                    if (hasDiscount)
                      Positioned(
                        top: AppDimensions.md,
                        left: AppDimensions.md,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.md,
                            vertical: AppDimensions.sm,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.discountPercent,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    Positioned(
                      top: AppDimensions.md,
                      right: AppDimensions.md,
                      child: Material(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            // TODO: favorite product
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------------------
              // Product Information
              // ----------------------------------------------------------
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.lg,
                    AppDimensions.lg,
                    AppDimensions.lg,
                    120,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.md,
                          vertical: AppDimensions.sm,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          product.category,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppDimensions.md),

                      // Title
                      Text(product.title, style: AppTextStyles.heading1),

                      const SizedBox(height: AppDimensions.md),

                      // Price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Rs. ${product.discountPrice.toStringAsFixed(0)}',
                            style: AppTextStyles.price.copyWith(fontSize: 26),
                          ),

                          if (hasDiscount) ...[
                            const SizedBox(width: AppDimensions.sm),

                            Text(
                              'Rs. ${product.price.toStringAsFixed(0)}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            const SizedBox(width: AppDimensions.sm),

                            Text(
                              'Save Rs. ${product.discountAmount.toStringAsFixed(0)}',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.success,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: AppDimensions.xl),

                      const Divider(),

                      const SizedBox(height: AppDimensions.lg),

                      // Description
                      Text('Description', style: AppTextStyles.heading3),

                      const SizedBox(height: AppDimensions.sm),

                      Html(
                        data: product.description,
                        style: {
                          'body': Style(
                            margin: Margins.zero,
                            padding: HtmlPaddings.zero,
                            fontSize: FontSize(15),
                            color: AppColors.textSecondary,
                            lineHeight: const LineHeight(1.6),
                          ),
                          'strong': Style(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                          'p': Style(margin: Margins.zero),
                        },
                      ),

                      const SizedBox(height: AppDimensions.xl),

                      const Divider(),

                      const SizedBox(height: AppDimensions.lg),

                      // Quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quantity', style: AppTextStyles.heading3),

                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: quantity > 1
                                      ? () {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      : null,
                                  icon: const Icon(Icons.remove),
                                ),

                                Text(
                                  '$quantity',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),

      // ------------------------------------------------------------
      // Bottom Add To Cart
      // ------------------------------------------------------------
      bottomNavigationBar: productAsync.maybeWhen(
        data: (product) {
          final total = product.discountPrice * quantity;

          return SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                AppDimensions.lg,
                AppDimensions.md,
                AppDimensions.lg,
                AppDimensions.md,
              ),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(0, -3),
                    color: Colors.black.withValues(alpha: 0.08),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Rs. ${total.toStringAsFixed(0)}',
                          style: AppTextStyles.price,
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: AppDimensions.buttonHeight,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await ref
                              .read(cartControllerProvider.notifier)
                              .addToCart(
                                productId: product.id,
                                quantity: quantity,
                              );

                          if (!context.mounted) return;

                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.success(
                              message: "Item added to cart",
                            ),
                          );
                          context.go(AppRoutes.home);
                        },
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text('Add to Cart'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        orElse: () => null,
      ),
    );
  }
}
