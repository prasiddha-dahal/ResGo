import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/product/data/models/product/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final double? width;

  const ProductCard({
    super.key,
    required this.product,
    this.width,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        widget.product.discountAmount > 0 &&
        widget.product.discountPrice < widget.product.price;

    return SizedBox(
      width: widget.width,
      child: Material(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          onTap: () => context.pushNamed(
            'productDetail',
            pathParameters: {
              'id': widget.product.id.toString(),
            },
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              border: Border.all(
                color: AppColors.border,
                width: 0.6,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          color: AppColors.border.withValues(alpha: 0.35),
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          color: AppColors.border.withValues(alpha: 0.35),
                          child: const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 36,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Discount badge
                    if (hasDiscount)
                      Positioned(
                        top: AppDimensions.sm,
                        left: AppDimensions.sm,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.product.discountPercent,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                    // Favorite button
                    Positioned(
                      top: AppDimensions.sm,
                      right: AppDimensions.sm,
                      child: Material(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Icon(
                              isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 18,
                              color: isFavourite
                                  ? AppColors.error
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Product Information
                Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.sm + 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category
                      Text(
                        widget.product.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Product title
                      Text(
                        widget.product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Rs. ${widget.product.discountPrice.toStringAsFixed(0)}',
                            style: AppTextStyles.price.copyWith(
                              fontSize: 16,
                            ),
                          ),

                          if (hasDiscount) ...[
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                'Rs. ${widget.product.price.toStringAsFixed(0)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: AppDimensions.sm),

                      // Add to cart
                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // TODO: Add to cart
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 17,
                          ),
                          label: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            textStyle: AppTextStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusSm,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
