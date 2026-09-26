import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    @JsonKey(name: 'order id') required int orderId,
    @JsonKey(name: 'total_amt', fromJson: _toNum) required num totalAmt,
    String? status,
    @JsonKey(name: 'payment_verification') String? paymentVerification,
    @JsonKey(name: 'payment_receipt') String? paymentReceipt,
    @Default([]) List<OrderItemModel> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required int quantity,
    required OrderProductModel product,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

@freezed
abstract class OrderProductModel with _$OrderProductModel {
  const factory OrderProductModel({
    required int id,
    required String title,
    String? description,
    required num price,
    @JsonKey(name: 'discount_percent') String? discountPercent,
    @JsonKey(name: 'discount_amount') num? discountAmount,
    @JsonKey(name: 'discounted_price') num? discountedPrice,
    String? image,
    String? category,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrderProductModelFromJson(json);
}

// Helpers
num _toNum(dynamic value) {
  if (value is num) return value;
  if (value is String) return num.tryParse(value) ?? 0;
  return 0;
}