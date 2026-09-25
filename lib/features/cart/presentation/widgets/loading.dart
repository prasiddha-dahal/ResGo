import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_dimensions.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.lg),
        child: LoadingAnimationWidget.beat(
          color: AppColors.primary,
          size: AppDimensions.iconLg,
        ),
      ),
    );
  }
}
