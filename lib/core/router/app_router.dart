import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/features/auth/presentation/screens/login_screen.dart';
import 'package:resgo/features/auth/presentation/screens/register_screen.dart';
import 'package:resgo/features/product/presentation/screens/home_screen.dart';
import 'package:resgo/features/product/presentation/screens/product_detail_screen.dart';
import 'package:resgo/features/splash/presentation/screen/splash_screen.dart';

/// Temporary placeholder screens – we will replace them feature by feature.
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 22))),
    );
  }
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'productDetail',
      path: AppRoutes.productDetail,
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        return ProductDetailScreen(productId: id);
      },
    ),
    GoRoute(
      path: AppRoutes.cart,
      builder: (context, state) => const PlaceholderScreen(title: 'Cart'),
    ),
    GoRoute(
      path: AppRoutes.orders,
      builder: (context, state) => const PlaceholderScreen(title: 'Orders'),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => const PlaceholderScreen(title: 'Profile'),
    ),
  ],
);
