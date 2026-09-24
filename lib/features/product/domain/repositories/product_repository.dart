import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/product/data/models/category/categories_response.dart';
import 'package:resgo/features/product/data/models/category/category.dart';
import 'package:resgo/features/product/data/models/product/product.dart';
import 'package:resgo/features/product/data/models/product/product_response.dart';

abstract class ProductRepository {
  EitherResponse<ProductResponse> getProducts();
  EitherResponse<Product> getProductById(int id);
  EitherResponse<ProductResponse> getFeaturedProducts();
  EitherResponse<CategoriesResponse> getCategories();
  EitherResponse<Category> getCategoryById(int id);
}