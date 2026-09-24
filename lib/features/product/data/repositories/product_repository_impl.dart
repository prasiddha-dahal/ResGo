import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resgo/core/api/base/base_remote_source.dart';
import 'package:resgo/core/api/error/app_error.dart';
import 'package:resgo/core/constants/api_endpoints.dart';
import 'package:resgo/core/network/network_info.dart';
import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/product/data/models/category/categories_response.dart';
import 'package:resgo/features/product/data/models/category/category.dart';
import 'package:resgo/features/product/data/models/product/product.dart';
import 'package:resgo/features/product/data/models/product/product_response.dart';
import 'package:resgo/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends BaseRemoteSource
    implements ProductRepository {
  // ignore: use_super_parameters
  ProductRepositoryImpl({required Dio dio, required NetworkInfo networkInfo})
    : super(dio: dio, networkInfo: networkInfo);

  @override
  EitherResponse<CategoriesResponse> getCategories() async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.categories);
        return CategoriesResponse.fromJson(result.data);
      });

      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<Category> getCategoryById(int id) async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.category(id));
        return Category.fromJson(result.data);
      });

      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<ProductResponse> getFeaturedProducts() async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.featuredProducts);
        final productResponse = result.data as Map<String, dynamic>;
        return ProductResponse.fromJson(productResponse);
      });

      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<Product> getProductById(int id) async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.product(id));
        return Product.fromJson(result.data["product"]);
      });

      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<ProductResponse> getProducts() async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.products);
        final productResponse = result.data as Map<String, dynamic>;
        return ProductResponse.fromJson(productResponse);
      });

      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }
}
