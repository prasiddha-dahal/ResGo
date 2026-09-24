// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  discountPercent: json['discount_percent'] as String,
  discountAmount: (json['discount_amount'] as num).toDouble(),
  discountPrice: (json['discount_price'] as num).toDouble(),
  image: json['image'] as String,
  category: json['category'] as String,
  isFeatured: json['is_featured'] as bool?,
  featuredOrder: (json['featured_order'] as num?)?.toInt(),
  featuredImage: json['featured_image'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'discount_percent': instance.discountPercent,
  'discount_amount': instance.discountAmount,
  'discount_price': instance.discountPrice,
  'image': instance.image,
  'category': instance.category,
  'is_featured': instance.isFeatured,
  'featured_order': instance.featuredOrder,
  'featured_image': instance.featuredImage,
};
