import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    @JsonKey(name: 'cart_id') required int cartId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_price', fromJson: _toNum) required num productPrice,
    @JsonKey(name: 'selling_price', fromJson: _toNum) required num sellingPrice,
    required int quantity,
    String? discount,
    @JsonKey(name: 'discount_amt', fromJson: _toNumNullable) num? discountAmount,
    @JsonKey(name: 'total_amt', fromJson: _toNum) required num totalAmount,
    @JsonKey(name: 'product_image') String? productImage,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);
}

/// Helpers to safely convert both String and num
num _toNum(dynamic value) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value) ?? 0;
  return 0;
}

num? _toNumNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value;
  if (value is String) return num.tryParse(value);
  return null;
}