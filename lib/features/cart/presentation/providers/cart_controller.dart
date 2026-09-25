import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/features/cart/data/models/cart.dart';
import 'package:resgo/features/cart/presentation/providers/cart_provider.dart';

class CartController extends AsyncNotifier<List<Cart>> {
  @override
  Future<List<Cart>> build() async {
    return _fetchCart();
  }

  Future<List<Cart>> _fetchCart() async {
    final result = await ref.read(cartRepositoryProvider).getCartItems();
    return result.fold((error) => throw error, (items) => items);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchCart);
  }

  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    final result = await ref
        .read(cartRepositoryProvider)
        .addToCart(productId: productId, quantity: quantity);

    result.fold(
      (error) => throw error,
      (_) => refresh(), // reload cart after adding
    );
  }

  Future<void> updateQuantity({
    required int cartId,
    required int quantity,
    required int productId,
  }) async {
    if (quantity < 1) {
      await removeItem(cartId);
      return;
    }

    final result = await ref
        .read(cartRepositoryProvider)
        .updateCartItem(
          cartId: cartId,
          quantity: quantity,
          productId: productId,
        );

    result.fold((error) => throw error, (_) => refresh());
  }

  Future<void> removeItem(int cartId) async {
    final result = await ref
        .read(cartRepositoryProvider)
        .deleteCartItem(cartId: cartId);

    result.fold((error) => throw error, (_) => refresh());
  }
}

final cartControllerProvider =
    AsyncNotifierProvider<CartController, List<Cart>>(CartController.new);
