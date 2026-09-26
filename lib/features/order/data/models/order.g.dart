// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  orderId: (json['order id'] as num).toInt(),
  totalAmt: _toNum(json['total_amt']),
  status: json['status'] as String?,
  paymentVerification: json['payment_verification'] as String?,
  paymentReceipt: json['payment_receipt'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'order id': instance.orderId,
      'total_amt': instance.totalAmt,
      'status': instance.status,
      'payment_verification': instance.paymentVerification,
      'payment_receipt': instance.paymentReceipt,
      'items': instance.items,
    };

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      quantity: (json['quantity'] as num).toInt(),
      product: OrderProductModel.fromJson(
        json['product'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'product': instance.product,
    };

_OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) =>
    _OrderProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      price: json['price'] as num,
      discountPercent: json['discount_percent'] as String?,
      discountAmount: json['discount_amount'] as num?,
      discountedPrice: json['discounted_price'] as num?,
      image: json['image'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$OrderProductModelToJson(_OrderProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discount_percent': instance.discountPercent,
      'discount_amount': instance.discountAmount,
      'discounted_price': instance.discountedPrice,
      'image': instance.image,
      'category': instance.category,
    };
