import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resgo/features/product/data/models/product/product.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required int id,
    required String title,
    String? slug,
    @Default([]) List<Product> products,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}