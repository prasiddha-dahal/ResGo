import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String description,
    required double price,
    @JsonKey(name: "discount_percent") required String discountPercent,
    @JsonKey(name: "discount_amount") required double discountAmount,
    @JsonKey(name: "discount_price") required double discountPrice,
    required String image,
    required String category,
    @JsonKey(name: "is_featured") bool? isFeatured,
    @JsonKey(name: "featured_order") int? featuredOrder,
    @JsonKey(name: "featured_image") String? featuredImage,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
