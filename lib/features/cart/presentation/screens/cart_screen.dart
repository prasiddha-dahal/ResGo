import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/cart/data/models/cart.dart';
import 'package:resgo/features/cart/presentation/providers/cart_controller.dart';
import 'package:resgo/features/cart/presentation/widgets/error.dart';
import 'package:resgo/features/cart/presentation/widgets/loading.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('My Cart', style: AppTextStyles.heading3),
      ),
      body: cartAsync.when(
        loading: () => Loading(),
        error: (error, _) => CartError(
          message: error.toString(),
          onRetry: () => ref.read(cartControllerProvider.notifier).refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.md),
                  Text('Your cart is empty', style: AppTextStyles.heading3),
                  const SizedBox(height: AppDimensions.sm),
                  Text(
                    'Add some products to get started',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          final total = items.fold<num>(
            0,
            (sum, item) => sum + item.totalAmount,
          );

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(AppDimensions.md),
                  itemCount: items.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: AppDimensions.sm),
                  itemBuilder: (context, index) {
                    return _CartItemTile(item: items[index]);
                  },
                ),
              ),

              // Bottom total + checkout
              Container(
                padding: const EdgeInsets.all(AppDimensions.lg),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppTextStyles.heading3),
                        Text('Rs. $total', style: AppTextStyles.price),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.md),
                    SizedBox(
                      width: double.infinity,
                      height: AppDimensions.buttonHeight,
                      child: ElevatedButton(
                        onPressed: () {
                          context.push(AppRoutes.checkout);
                        },
                        child: const Text('Proceed to Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartItemTile extends ConsumerWidget {
  final Cart item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.sm),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
            child: SizedBox(
              width: 80,
              height: 80,
              child: item.productImage != null
                  ? CachedNetworkImage(
                      imageUrl: item.productImage!,
                      fit: BoxFit.cover,
                    )
                  : Container(color: AppColors.border),
            ),
          ),
          const SizedBox(width: AppDimensions.sm),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rs. ${item.sellingPrice}',
                  style: AppTextStyles.price.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 8),

                // Quantity controls
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => notifier.updateQuantity(
                        cartId: item.cartId,
                        quantity: item.quantity - 1,
                        productId: item.productId,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.quantity}',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => notifier.updateQuantity(
                        cartId: item.cartId,
                        quantity: item.quantity + 1,
                        productId: item.productId,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                      ),
                      onPressed: () => notifier.removeItem(item.cartId),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
