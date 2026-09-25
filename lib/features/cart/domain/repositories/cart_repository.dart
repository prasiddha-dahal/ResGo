import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/cart/data/models/cart.dart';

abstract class CartRepository {
  EitherResponse<List<Cart>> getCartItems();
  EitherResponse<void> addToCart({
    required int productId,
    required int quantity,
  });
  EitherResponse<void> updateCartItem({
    required int cartId,
    required int productId,
    required int quantity,
  });
  EitherResponse<void> deleteCartItem({required int cartId});
}
