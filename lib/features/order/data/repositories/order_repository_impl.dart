import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resgo/core/api/base/base_remote_source.dart';
import 'package:resgo/core/api/error/app_error.dart';
import 'package:resgo/core/constants/api_endpoints.dart';
import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/order/data/models/order.dart';
import 'package:resgo/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl extends BaseRemoteSource implements OrderRepoistory {
  OrderRepositoryImpl({required super.dio, required super.networkInfo});

  @override
  EitherResponse<void> cancelOrder(int orderId) async {
    try {
      await callApi(() async {
        await dio.patch(
          ApiEndpoints.orderById(orderId),
          data: {'status': 'cancel'},
        );
      });
      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<void> deleteOrder(int orderId) async {
    try {
      await callApi(() async {
        await dio.delete(ApiEndpoints.orderById(orderId));
      });
      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<List<OrderModel>> getOrders() async {
    try {
      final response = await callApi(() async {
        final result = await dio.get(ApiEndpoints.orders);
        final data = result.data as Map<String, dynamic>;
        if (data['success'] == false || data['sucess'] == false) {
          return <OrderModel>[];
        }

        final orderList = (data['orders'] as List<dynamic>?) ?? [];
        return orderList
            .map((order) => OrderModel.fromJson(order as Map<String, dynamic>))
            .toList();
      });
      return right(response);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<void> placeOrder({
    required List<Map<String, dynamic>> items,
    required File paymentReceipt,
  }) async {
    try {
      await callApi(() async {
        final formData = FormData.fromMap({
          'items': items,
          'payment_receipt': await MultipartFile.fromFile(
            paymentReceipt.path,
            filename: paymentReceipt.path.split('/').last,
          ),
        });

        await dio.post(ApiEndpoints.order, data: formData);
      });
      return right(null);
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }
}
