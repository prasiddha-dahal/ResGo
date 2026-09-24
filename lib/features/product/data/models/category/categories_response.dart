import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resgo/features/product/data/models/category/category.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
abstract class CategoriesResponse with _$CategoriesResponse {
  const factory CategoryResponse({
    required bool success,
    required List<Category> data
  }) = _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);
}