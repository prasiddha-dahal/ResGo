import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/core/theme/app_colors.dart';
import 'package:resgo/core/theme/app_text_styles.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    // Small delay for better UX
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    final sessionService = await ref.read(sessionServiceProvider.future);

    if (sessionService.isLoggedIn && sessionService.token != null) {
      context.go(AppRoutes.home);
    } else {
      context.go(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 16),
            Text(
              'Ecommerce Clean',
              style: AppTextStyles.heading1.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Clean Architecture Demo',
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}