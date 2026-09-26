import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:resgo/core/router/app_routes.dart';
import 'package:resgo/features/auth/presentation/screens/login_screen.dart';
import 'package:resgo/features/auth/presentation/screens/register_screen.dart';
import 'package:resgo/features/cart/presentation/screens/cart_screen.dart';
import 'package:resgo/features/order/presentation/screens/checkout_screen.dart';
import 'package:resgo/features/order/presentation/screens/orders_screen.dart';
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
      pageBuilder: GoTransitions.slide.toRight.build(
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.register,
      pageBuilder: GoTransitions.slide.toLeft.build(
        child: const RegisterScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: GoTransitions.fade.build(child: const HomeScreen()),
    ),
    GoRoute(
      name: 'productDetail',
      path: AppRoutes.productDetail,
      pageBuilder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;

        return GoTransitions.slide.toLeft.build(
          child: ProductDetailScreen(productId: id),
        )(context, state);
      },
    ),
    GoRoute(
      path: AppRoutes.cart,
      pageBuilder: GoTransitions.fade.build(child: const CartScreen()),
    ),
    GoRoute(
      path: AppRoutes.orders,
      builder: (context, state) => const OrdersScreen(),
    ),

    GoRoute(
      path: AppRoutes.checkout,
      builder: (context, state) => const CheckoutScreen(),
    ),
   
  ],
);
