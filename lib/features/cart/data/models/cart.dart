import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    @JsonKey(name: "cart_id") required int cartId,
    @JsonKey(name: "product_id") required int productId,
    @JsonKey(name: "product_name") required String productName,
    @JsonKey(name: "product_price") required double productPrice,
    @JsonKey(name: "selling_price") required double sellingPrice,
    @JsonKey(name: "discount") required double discountPercent,
    @JsonKey(name: "discount_amt") required double discountAmount,
    @JsonKey(name: "total_amt") required double totalAmount,
    @JsonKey(name: "product_image") required String productImage,
    required int quantity,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);
}
