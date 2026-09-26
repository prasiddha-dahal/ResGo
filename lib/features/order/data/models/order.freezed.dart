// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

@JsonKey(name: 'order id') int get orderId;@JsonKey(name: 'total_amt', fromJson: _toNum) num get totalAmt; String? get status;@JsonKey(name: 'payment_verification') String? get paymentVerification;@JsonKey(name: 'payment_receipt') String? get paymentReceipt; List<OrderItemModel> get items;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.orderId, _this.orderId) || other.orderId == _this.orderId)&&(identical(other.totalAmt, _this.totalAmt) || other.totalAmt == _this.totalAmt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.paymentVerification, _this.paymentVerification) || other.paymentVerification == _this.paymentVerification)&&(identical(other.paymentReceipt, _this.paymentReceipt) || other.paymentReceipt == _this.paymentReceipt)&&const DeepCollectionEquality().equals(other.items, _this.items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderModel;
  return Object.hash(runtimeType,_this.orderId,_this.totalAmt,_this.status,_this.paymentVerification,_this.paymentReceipt,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as OrderModel;
  return 'OrderModel(orderId: ${_this.orderId}, totalAmt: ${_this.totalAmt}, status: ${_this.status}, paymentVerification: ${_this.paymentVerification}, paymentReceipt: ${_this.paymentReceipt}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order id') int orderId,@JsonKey(name: 'total_amt', fromJson: _toNum) num totalAmt, String? status,@JsonKey(name: 'payment_verification') String? paymentVerification,@JsonKey(name: 'payment_receipt') String? paymentReceipt, List<OrderItemModel> items
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? totalAmt = null,Object? status = freezed,Object? paymentVerification = freezed,Object? paymentReceipt = freezed,Object? items = null,}) {
  return _then(OrderModel(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,totalAmt: null == totalAmt ? _self.totalAmt : totalAmt // ignore: cast_nullable_to_non_nullable
as num,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paymentVerification: freezed == paymentVerification ? _self.paymentVerification : paymentVerification // ignore: cast_nullable_to_non_nullable
as String?,paymentReceipt: freezed == paymentReceipt ? _self.paymentReceipt : paymentReceipt // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order id')  int orderId, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmt,  String? status, @JsonKey(name: 'payment_verification')  String? paymentVerification, @JsonKey(name: 'payment_receipt')  String? paymentReceipt,  List<OrderItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.orderId,_that.totalAmt,_that.status,_that.paymentVerification,_that.paymentReceipt,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order id')  int orderId, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmt,  String? status, @JsonKey(name: 'payment_verification')  String? paymentVerification, @JsonKey(name: 'payment_receipt')  String? paymentReceipt,  List<OrderItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.orderId,_that.totalAmt,_that.status,_that.paymentVerification,_that.paymentReceipt,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order id')  int orderId, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmt,  String? status, @JsonKey(name: 'payment_verification')  String? paymentVerification, @JsonKey(name: 'payment_receipt')  String? paymentReceipt,  List<OrderItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.orderId,_that.totalAmt,_that.status,_that.paymentVerification,_that.paymentReceipt,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({@JsonKey(name: 'order id') required this.orderId, @JsonKey(name: 'total_amt', fromJson: _toNum) required this.totalAmt, this.status, @JsonKey(name: 'payment_verification') this.paymentVerification, @JsonKey(name: 'payment_receipt') this.paymentReceipt,  List<OrderItemModel> items = const []}): _items = items;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override@JsonKey(name: 'order id') final  int orderId;
@override@JsonKey(name: 'total_amt', fromJson: _toNum) final  num totalAmt;
@override final  String? status;
@override@JsonKey(name: 'payment_verification') final  String? paymentVerification;
@override@JsonKey(name: 'payment_receipt') final  String? paymentReceipt;
 final  List<OrderItemModel> _items;
@override@JsonKey() List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.totalAmt, totalAmt) || other.totalAmt == totalAmt)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentVerification, paymentVerification) || other.paymentVerification == paymentVerification)&&(identical(other.paymentReceipt, paymentReceipt) || other.paymentReceipt == paymentReceipt)&&const DeepCollectionEquality().equals(other.items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,orderId,totalAmt,status,paymentVerification,paymentReceipt,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'OrderModel(orderId: $orderId, totalAmt: $totalAmt, status: $status, paymentVerification: $paymentVerification, paymentReceipt: $paymentReceipt, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order id') int orderId,@JsonKey(name: 'total_amt', fromJson: _toNum) num totalAmt, String? status,@JsonKey(name: 'payment_verification') String? paymentVerification,@JsonKey(name: 'payment_receipt') String? paymentReceipt, List<OrderItemModel> items
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? totalAmt = null,Object? status = freezed,Object? paymentVerification = freezed,Object? paymentReceipt = freezed,Object? items = null,}) {
  return _then(_OrderModel(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,totalAmt: null == totalAmt ? _self.totalAmt : totalAmt // ignore: cast_nullable_to_non_nullable
as num,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paymentVerification: freezed == paymentVerification ? _self.paymentVerification : paymentVerification // ignore: cast_nullable_to_non_nullable
as String?,paymentReceipt: freezed == paymentReceipt ? _self.paymentReceipt : paymentReceipt // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}


}


/// @nodoc
mixin _$OrderItemModel {

 int get quantity; OrderProductModel get product;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.product, _this.product) || other.product == _this.product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderItemModel;
  return Object.hash(runtimeType,_this.quantity,_this.product);
}

@override
String toString() {
  final _this = this as OrderItemModel;
  return 'OrderItemModel(quantity: ${_this.quantity}, product: ${_this.product})';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 int quantity, OrderProductModel product
});


$OrderProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quantity = null,Object? product = null,}) {
  return _then(OrderItemModel(
quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductModel,
  ));
}
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<$Res> get product {
  
  return $OrderProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int quantity,  OrderProductModel product)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.quantity,_that.product);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int quantity,  OrderProductModel product)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.quantity,_that.product);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int quantity,  OrderProductModel product)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.quantity,_that.product);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.quantity, required this.product});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  int quantity;
@override final  OrderProductModel product;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.product, product) || other.product == product));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,quantity,product);
}

@override
String toString() {
    return 'OrderItemModel(quantity: $quantity, product: $product)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int quantity, OrderProductModel product
});


@override $OrderProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quantity = null,Object? product = null,}) {
  return _then(_OrderItemModel(
quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as OrderProductModel,
  ));
}

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<$Res> get product {
  
  return $OrderProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// @nodoc
mixin _$OrderProductModel {

 int get id; String get title; String? get description; num get price;@JsonKey(name: 'discount_percent') String? get discountPercent;@JsonKey(name: 'discount_amount') num? get discountAmount;@JsonKey(name: 'discounted_price') num? get discountedPrice; String? get image; String? get category;
/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderProductModelCopyWith<OrderProductModel> get copyWith => _$OrderProductModelCopyWithImpl<OrderProductModel>(this as OrderProductModel, _$identity);

  /// Serializes this OrderProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderProductModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderProductModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.discountedPrice, _this.discountedPrice) || other.discountedPrice == _this.discountedPrice)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.category, _this.category) || other.category == _this.category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderProductModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.price,_this.discountPercent,_this.discountAmount,_this.discountedPrice,_this.image,_this.category);
}

@override
String toString() {
  final _this = this as OrderProductModel;
  return 'OrderProductModel(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, price: ${_this.price}, discountPercent: ${_this.discountPercent}, discountAmount: ${_this.discountAmount}, discountedPrice: ${_this.discountedPrice}, image: ${_this.image}, category: ${_this.category})';
}


}

/// @nodoc
abstract mixin class $OrderProductModelCopyWith<$Res>  {
  factory $OrderProductModelCopyWith(OrderProductModel value, $Res Function(OrderProductModel) _then) = _$OrderProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String? description, num price,@JsonKey(name: 'discount_percent') String? discountPercent,@JsonKey(name: 'discount_amount') num? discountAmount,@JsonKey(name: 'discounted_price') num? discountedPrice, String? image, String? category
});




}
/// @nodoc
class _$OrderProductModelCopyWithImpl<$Res>
    implements $OrderProductModelCopyWith<$Res> {
  _$OrderProductModelCopyWithImpl(this._self, this._then);

  final OrderProductModel _self;
  final $Res Function(OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? price = null,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountedPrice = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(OrderProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num?,discountedPrice: freezed == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as num?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderProductModel].
extension OrderProductModelPatterns on OrderProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderProductModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String? description,  num price, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  num? discountAmount, @JsonKey(name: 'discounted_price')  num? discountedPrice,  String? image,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountedPrice,_that.image,_that.category);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String? description,  num price, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  num? discountAmount, @JsonKey(name: 'discounted_price')  num? discountedPrice,  String? image,  String? category)  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel():
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountedPrice,_that.image,_that.category);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String? description,  num price, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  num? discountAmount, @JsonKey(name: 'discounted_price')  num? discountedPrice,  String? image,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _OrderProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountedPrice,_that.image,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderProductModel implements OrderProductModel {
  const _OrderProductModel({required this.id, required this.title, this.description, required this.price, @JsonKey(name: 'discount_percent') this.discountPercent, @JsonKey(name: 'discount_amount') this.discountAmount, @JsonKey(name: 'discounted_price') this.discountedPrice, this.image, this.category});
  factory _OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String? description;
@override final  num price;
@override@JsonKey(name: 'discount_percent') final  String? discountPercent;
@override@JsonKey(name: 'discount_amount') final  num? discountAmount;
@override@JsonKey(name: 'discounted_price') final  num? discountedPrice;
@override final  String? image;
@override final  String? category;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderProductModelCopyWith<_OrderProductModel> get copyWith => __$OrderProductModelCopyWithImpl<_OrderProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,price,discountPercent,discountAmount,discountedPrice,image,category);
}

@override
String toString() {
    return 'OrderProductModel(id: $id, title: $title, description: $description, price: $price, discountPercent: $discountPercent, discountAmount: $discountAmount, discountedPrice: $discountedPrice, image: $image, category: $category)';
}


}

/// @nodoc
abstract mixin class _$OrderProductModelCopyWith<$Res> implements $OrderProductModelCopyWith<$Res> {
  factory _$OrderProductModelCopyWith(_OrderProductModel value, $Res Function(_OrderProductModel) _then) = __$OrderProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String? description, num price,@JsonKey(name: 'discount_percent') String? discountPercent,@JsonKey(name: 'discount_amount') num? discountAmount,@JsonKey(name: 'discounted_price') num? discountedPrice, String? image, String? category
});




}
/// @nodoc
class __$OrderProductModelCopyWithImpl<$Res>
    implements _$OrderProductModelCopyWith<$Res> {
  __$OrderProductModelCopyWithImpl(this._self, this._then);

  final _OrderProductModel _self;
  final $Res Function(_OrderProductModel) _then;

/// Create a copy of OrderProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? price = null,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountedPrice = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(_OrderProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num?,discountedPrice: freezed == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as num?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
