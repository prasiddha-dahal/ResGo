import 'dart:io';

import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/order/data/models/order.dart';

abstract class OrderRepoistory {
  EitherResponse<List<OrderModel>> getOrders();
  EitherResponse<void> cancelOrder(int orderId);
  EitherResponse<void> deleteOrder(int deleteId);
  EitherResponse<void> placeOrder({
    required List<Map<String, dynamic>> items,
    required File paymentReceipt,
  });
}
