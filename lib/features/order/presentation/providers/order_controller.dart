import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resgo/features/order/data/models/order.dart';
import 'package:resgo/features/order/presentation/providers/order_provider.dart';

class OrderController extends AsyncNotifier<List<OrderModel>> {
  @override
  FutureOr<List<OrderModel>> build() {
    return _fetchOrders();
  }

  Future<List<OrderModel>> _fetchOrders() async {
    final result = await ref.read(orderRepositoryProvider).getOrders();
    return result.fold(
      (e) {
        return throw e;
      },
      (orders) {
        return orders;
      },
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchOrders);
  }

  Future<void> placeOrder({
    required List<Map<String, dynamic>> items,
    required File paymentReceipt,
  }) async {
    final result = await ref
        .read(orderRepositoryProvider)
        .placeOrder(items: items, paymentReceipt: paymentReceipt);

    result.fold((error) => throw error, (_) => refresh());
  }

  Future<void> cancelOrder(int orderId) async {
    final result = await ref.read(orderRepositoryProvider).cancelOrder(orderId);

    result.fold((error) => throw error, (_) => refresh());
  }

  Future<void> deleteOrder(int orderId) async {
    final result = await ref.read(orderRepositoryProvider).deleteOrder(orderId);

    result.fold((error) => throw error, (_) => refresh());
  }
}

final orderControllerProvider =
    AsyncNotifierProvider<OrderController, List<OrderModel>>(
      OrderController.new,
    );
