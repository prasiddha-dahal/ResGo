// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  cartId: (json['cart_id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  productName: json['product_name'] as String,
  productPrice: _toNum(json['product_price']),
  sellingPrice: _toNum(json['selling_price']),
  quantity: (json['quantity'] as num).toInt(),
  discount: json['discount'] as String?,
  discountAmount: _toNumNullable(json['discount_amt']),
  totalAmount: _toNum(json['total_amt']),
  productImage: json['product_image'] as String?,
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'cart_id': instance.cartId,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_price': instance.productPrice,
  'selling_price': instance.sellingPrice,
  'quantity': instance.quantity,
  'discount': instance.discount,
  'discount_amt': instance.discountAmount,
  'total_amt': instance.totalAmount,
  'product_image': instance.productImage,
};
