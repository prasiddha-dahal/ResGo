import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';
import 'package:resgo/features/cart/presentation/providers/cart_controller.dart';
import 'package:resgo/features/cart/presentation/widgets/loading.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/order_controller.dart' show orderControllerProvider;

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  File? _receipt;
  bool _isPlacingOrder = false;

  Future<void> _pickReceipt() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _receipt = File(picked.path));
    }
  }

  Future<void> _placeOrder() async {
    if (_receipt == null) {
      showTopSnackBar(
        Overlay.of(context),
        displayDuration: Duration(milliseconds: 200),
        CustomSnackBar.error(message: "Please upload payment receipt"),
      );
      return;
    }

    final cartItems = ref.read(cartControllerProvider).asData?.value ?? [];
    if (cartItems.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        displayDuration: Duration(milliseconds: 200),
        CustomSnackBar.error(message: "Cart is empty"),
      );
      return;
    }

    setState(() => _isPlacingOrder = true);

    try {
      final items = cartItems
          .map((item) => {'product_id': item.productId, 'qty': item.quantity})
          .toList();

      await ref
          .read(orderControllerProvider.notifier)
          .placeOrder(items: items, paymentReceipt: _receipt!);

      await ref.read(cartControllerProvider.notifier).clearCart();

      if (mounted) {
        showTopSnackBar(
          Overlay.of(context),
          displayDuration: Duration(milliseconds: 200),
          CustomSnackBar.success(message: "Order placed successfully"),
        );
        context.go(AppRoutes.orders);
      }
    } catch (e) {
      if (mounted) {
        showTopSnackBar(
          Overlay.of(context),
          displayDuration: Duration(milliseconds: 1000),
          CustomSnackBar.error(message: e.toString()),
        );
      }
    } finally {
      if (mounted) setState(() => _isPlacingOrder = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartAsync = ref.watch(cartControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Checkout', style: AppTextStyles.heading3),
      ),
      body: cartAsync.when(
        loading: () => const Loading(),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (items) {
          final total = items.fold<num>(0, (sum, i) => sum + i.totalAmount);

          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(AppDimensions.lg),
                  children: [
                    Text('Order Summary', style: AppTextStyles.heading2),
                    const SizedBox(height: AppDimensions.md),
                    ...items.map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item.productName),
                        subtitle: Text('Qty: ${item.quantity}'),
                        trailing: Text('Rs. ${item.totalAmount}'),
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: AppTextStyles.heading3),
                        Text('Rs. $total', style: AppTextStyles.price),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.xl),
                    Text('Payment Receipt', style: AppTextStyles.heading3),
                    const SizedBox(height: AppDimensions.sm),
                    GestureDetector(
                      onTap: _pickReceipt,
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.radiusMd,
                          ),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: _receipt == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.upload_file,
                                    size: 40,
                                    color: AppColors.textSecondary,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tap to upload receipt',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.radiusMd,
                                ),
                                child: Image.file(
                                  _receipt!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppDimensions.lg),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  border: Border(top: BorderSide(color: AppColors.border)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: AppDimensions.buttonHeight,
                  child: ElevatedButton(
                    onPressed: _isPlacingOrder ? null : _placeOrder,
                    child: _isPlacingOrder
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(AppDimensions.lg),
                              child: LoadingAnimationWidget.beat(
                                color: AppColors.primary,
                                size: AppDimensions.iconLg,
                              ),
                            ),
                          )
                        : const Text('Place Order'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
