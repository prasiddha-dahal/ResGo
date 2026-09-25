// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  cartId: (json['cart_id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  productName: json['product_name'] as String,
  productPrice: (json['product_price'] as num).toDouble(),
  sellingPrice: (json['selling_price'] as num).toDouble(),
  discountPercent: (json['discount'] as num).toDouble(),
  discountAmount: (json['discount_amt'] as num).toDouble(),
  totalAmount: (json['total_amt'] as num).toDouble(),
  productImage: json['product_image'] as String,
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'cart_id': instance.cartId,
  'product_id': instance.productId,
  'product_name': instance.productName,
  'product_price': instance.productPrice,
  'selling_price': instance.sellingPrice,
  'discount': instance.discountPercent,
  'discount_amt': instance.discountAmount,
  'total_amt': instance.totalAmount,
  'product_image': instance.productImage,
  'quantity': instance.quantity,
};
