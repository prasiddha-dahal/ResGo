import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/router/app_routes.dart';

import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/order/data/models/order.dart';
import 'package:resgo/features/order/presentation/providers/order_controller.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(orderControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('My Orders', style: AppTextStyles.heading3),
      ),
      body: ordersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.toString(),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.md),
              ElevatedButton(
                onPressed: () =>
                    ref.read(orderControllerProvider.notifier).refresh(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (orders) {
          if (orders.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: AppDimensions.md),
                  Text('No orders yet', style: AppTextStyles.heading3),
                  const SizedBox(height: AppDimensions.sm),
                  Text(
                    'Your order history will appear here',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () =>
                ref.read(orderControllerProvider.notifier).refresh(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(AppDimensions.md),
                    itemCount: orders.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppDimensions.sm),
                    itemBuilder: (context, index) {
                      return _OrderCard(order: orders[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.xl),
                  child: SizedBox(
                    height: AppDimensions.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRoutes.home);
                      },
                      child: const Icon(Icons.home_filled, size: AppDimensions.iconLg,),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _OrderCard extends ConsumerWidget {
  final OrderModel order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.md),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order #${order.orderId}', style: AppTextStyles.heading3),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.status ?? 'Pending',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.sm),
          const SizedBox(height: AppDimensions.sm),
          Text(
            'Total: Rs. ${order.totalAmt}',
            style: AppTextStyles.price.copyWith(fontSize: 16),
          ),
          const SizedBox(height: AppDimensions.md),
          Row(
            children: [
              if ((order.status ?? '').toLowerCase() != 'cancel')
                TextButton(
                  onPressed: () {
                    ref
                        .read(orderControllerProvider.notifier)
                        .cancelOrder(order.orderId);
                  },
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
