import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resgo/core/api/base/base_remote_source.dart';
import 'package:resgo/core/api/error/app_error.dart';
import 'package:resgo/core/constants/api_endpoints.dart';
import 'package:resgo/core/network/network_info.dart';
import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/cart/data/models/cart.dart';
import 'package:resgo/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends BaseRemoteSource implements CartRepository {
  // ignore: use_super_parameters
  CartRepositoryImpl({required Dio dio, required NetworkInfo networkInfo})
    : super(dio: dio, networkInfo: networkInfo);

  @override
  EitherResponse<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      await callApi(() async {
        await dio.post(
          ApiEndpoints.cart,
          data: {"product_id": productId, "qty": quantity},
        );
      });

      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<void> deleteCartItem({required int cartId}) async {
    try {
      await callApi(() async {
        await dio.delete(ApiEndpoints.cartItem(cartId));
      });
      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<List<Cart>> getCartItems() async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.carts);
        final data = result.data as Map<String, dynamic>;
        if (data['success'] == false || data['sucess'] == false) {
          return <Cart>[];
        }

        final cartList = (data["data"] as List<dynamic>?) ?? [];
        return cartList
            .map((cart) => Cart.fromJson(cart as Map<String, dynamic>))
            .toList();
      });
      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<void> updateCartItem({
    required int cartId,
    required int productId,
    required int quantity,
  }) async {
    try {
      await callApi(() async {
        await dio.patch(
          ApiEndpoints.cartItem(cartId),
          data: {"product_id": productId, "qty": quantity},
        );
      });

      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }
}
