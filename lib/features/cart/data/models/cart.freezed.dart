// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {

@JsonKey(name: 'cart_id') int get cartId;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name') String get productName;@JsonKey(name: 'product_price', fromJson: _toNum) num get productPrice;@JsonKey(name: 'selling_price', fromJson: _toNum) num get sellingPrice; int get quantity; String? get discount;@JsonKey(name: 'discount_amt', fromJson: _toNumNullable) num? get discountAmount;@JsonKey(name: 'total_amt', fromJson: _toNum) num get totalAmount;@JsonKey(name: 'product_image') String? get productImage;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Cart;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.cartId, _this.cartId) || other.cartId == _this.cartId)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.productName, _this.productName) || other.productName == _this.productName)&&(identical(other.productPrice, _this.productPrice) || other.productPrice == _this.productPrice)&&(identical(other.sellingPrice, _this.sellingPrice) || other.sellingPrice == _this.sellingPrice)&&(identical(other.quantity, _this.quantity) || other.quantity == _this.quantity)&&(identical(other.discount, _this.discount) || other.discount == _this.discount)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.totalAmount, _this.totalAmount) || other.totalAmount == _this.totalAmount)&&(identical(other.productImage, _this.productImage) || other.productImage == _this.productImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Cart;
  return Object.hash(runtimeType,_this.cartId,_this.productId,_this.productName,_this.productPrice,_this.sellingPrice,_this.quantity,_this.discount,_this.discountAmount,_this.totalAmount,_this.productImage);
}

@override
String toString() {
  final _this = this as Cart;
  return 'Cart(cartId: ${_this.cartId}, productId: ${_this.productId}, productName: ${_this.productName}, productPrice: ${_this.productPrice}, sellingPrice: ${_this.sellingPrice}, quantity: ${_this.quantity}, discount: ${_this.discount}, discountAmount: ${_this.discountAmount}, totalAmount: ${_this.totalAmount}, productImage: ${_this.productImage})';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cart_id') int cartId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_price', fromJson: _toNum) num productPrice,@JsonKey(name: 'selling_price', fromJson: _toNum) num sellingPrice, int quantity, String? discount,@JsonKey(name: 'discount_amt', fromJson: _toNumNullable) num? discountAmount,@JsonKey(name: 'total_amt', fromJson: _toNum) num totalAmount,@JsonKey(name: 'product_image') String? productImage
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartId = null,Object? productId = null,Object? productName = null,Object? productPrice = null,Object? sellingPrice = null,Object? quantity = null,Object? discount = freezed,Object? discountAmount = freezed,Object? totalAmount = null,Object? productImage = freezed,}) {
  return _then(Cart(
cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as num,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cart_id')  int cartId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price', fromJson: _toNum)  num productPrice, @JsonKey(name: 'selling_price', fromJson: _toNum)  num sellingPrice,  int quantity,  String? discount, @JsonKey(name: 'discount_amt', fromJson: _toNumNullable)  num? discountAmount, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmount, @JsonKey(name: 'product_image')  String? productImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.cartId,_that.productId,_that.productName,_that.productPrice,_that.sellingPrice,_that.quantity,_that.discount,_that.discountAmount,_that.totalAmount,_that.productImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cart_id')  int cartId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price', fromJson: _toNum)  num productPrice, @JsonKey(name: 'selling_price', fromJson: _toNum)  num sellingPrice,  int quantity,  String? discount, @JsonKey(name: 'discount_amt', fromJson: _toNumNullable)  num? discountAmount, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmount, @JsonKey(name: 'product_image')  String? productImage)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.cartId,_that.productId,_that.productName,_that.productPrice,_that.sellingPrice,_that.quantity,_that.discount,_that.discountAmount,_that.totalAmount,_that.productImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cart_id')  int cartId, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name')  String productName, @JsonKey(name: 'product_price', fromJson: _toNum)  num productPrice, @JsonKey(name: 'selling_price', fromJson: _toNum)  num sellingPrice,  int quantity,  String? discount, @JsonKey(name: 'discount_amt', fromJson: _toNumNullable)  num? discountAmount, @JsonKey(name: 'total_amt', fromJson: _toNum)  num totalAmount, @JsonKey(name: 'product_image')  String? productImage)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.cartId,_that.productId,_that.productName,_that.productPrice,_that.sellingPrice,_that.quantity,_that.discount,_that.discountAmount,_that.totalAmount,_that.productImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart implements Cart {
  const _Cart({@JsonKey(name: 'cart_id') required this.cartId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name') required this.productName, @JsonKey(name: 'product_price', fromJson: _toNum) required this.productPrice, @JsonKey(name: 'selling_price', fromJson: _toNum) required this.sellingPrice, required this.quantity, this.discount, @JsonKey(name: 'discount_amt', fromJson: _toNumNullable) this.discountAmount, @JsonKey(name: 'total_amt', fromJson: _toNum) required this.totalAmount, @JsonKey(name: 'product_image') this.productImage});
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override@JsonKey(name: 'cart_id') final  int cartId;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name') final  String productName;
@override@JsonKey(name: 'product_price', fromJson: _toNum) final  num productPrice;
@override@JsonKey(name: 'selling_price', fromJson: _toNum) final  num sellingPrice;
@override final  int quantity;
@override final  String? discount;
@override@JsonKey(name: 'discount_amt', fromJson: _toNumNullable) final  num? discountAmount;
@override@JsonKey(name: 'total_amt', fromJson: _toNum) final  num totalAmount;
@override@JsonKey(name: 'product_image') final  String? productImage;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.productImage, productImage) || other.productImage == productImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cartId,productId,productName,productPrice,sellingPrice,quantity,discount,discountAmount,totalAmount,productImage);
}

@override
String toString() {
    return 'Cart(cartId: $cartId, productId: $productId, productName: $productName, productPrice: $productPrice, sellingPrice: $sellingPrice, quantity: $quantity, discount: $discount, discountAmount: $discountAmount, totalAmount: $totalAmount, productImage: $productImage)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cart_id') int cartId,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name') String productName,@JsonKey(name: 'product_price', fromJson: _toNum) num productPrice,@JsonKey(name: 'selling_price', fromJson: _toNum) num sellingPrice, int quantity, String? discount,@JsonKey(name: 'discount_amt', fromJson: _toNumNullable) num? discountAmount,@JsonKey(name: 'total_amt', fromJson: _toNum) num totalAmount,@JsonKey(name: 'product_image') String? productImage
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartId = null,Object? productId = null,Object? productName = null,Object? productPrice = null,Object? sellingPrice = null,Object? quantity = null,Object? discount = freezed,Object? discountAmount = freezed,Object? totalAmount = null,Object? productImage = freezed,}) {
  return _then(_Cart(
cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as num,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as num,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as num?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
