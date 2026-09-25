import 'package:flutter/material.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';
import 'package:resgo/core/theme/app_text_styles.dart';

class CartError extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const CartError({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.md,
        vertical: AppDimensions.sm,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.error),

            const SizedBox(width: AppDimensions.sm),

            Expanded(child: Text(message, style: AppTextStyles.bodyMedium)),

            if (onRetry != null)
              TextButton(
                onPressed: onRetry,
                child: Text(
                  'Retry',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
