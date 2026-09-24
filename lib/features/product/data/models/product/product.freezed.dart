// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int get id; String get title; String get description; double get price;@JsonKey(name: "discount_percent") String get discountPercent;@JsonKey(name: "discount_amount") double get discountAmount;@JsonKey(name: "discounted_price") double get discountPrice; String get image; String get category;@JsonKey(name: "is_featured") bool? get isFeatured;@JsonKey(name: "featured_order") int? get featuredOrder;@JsonKey(name: "featured_image") String? get featuredImage;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Product;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.discountAmount, _this.discountAmount) || other.discountAmount == _this.discountAmount)&&(identical(other.discountPrice, _this.discountPrice) || other.discountPrice == _this.discountPrice)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.isFeatured, _this.isFeatured) || other.isFeatured == _this.isFeatured)&&(identical(other.featuredOrder, _this.featuredOrder) || other.featuredOrder == _this.featuredOrder)&&(identical(other.featuredImage, _this.featuredImage) || other.featuredImage == _this.featuredImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Product;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.price,_this.discountPercent,_this.discountAmount,_this.discountPrice,_this.image,_this.category,_this.isFeatured,_this.featuredOrder,_this.featuredImage);
}

@override
String toString() {
  final _this = this as Product;
  return 'Product(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, price: ${_this.price}, discountPercent: ${_this.discountPercent}, discountAmount: ${_this.discountAmount}, discountPrice: ${_this.discountPrice}, image: ${_this.image}, category: ${_this.category}, isFeatured: ${_this.isFeatured}, featuredOrder: ${_this.featuredOrder}, featuredImage: ${_this.featuredImage})';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, double price,@JsonKey(name: "discount_percent") String discountPercent,@JsonKey(name: "discount_amount") double discountAmount,@JsonKey(name: "discounted_price") double discountPrice, String image, String category,@JsonKey(name: "is_featured") bool? isFeatured,@JsonKey(name: "featured_order") int? featuredOrder,@JsonKey(name: "featured_image") String? featuredImage
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,Object? discountPercent = null,Object? discountAmount = null,Object? discountPrice = null,Object? image = null,Object? category = null,Object? isFeatured = freezed,Object? featuredOrder = freezed,Object? featuredImage = freezed,}) {
  return _then(Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,discountPrice: null == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isFeatured: freezed == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool?,featuredOrder: freezed == featuredOrder ? _self.featuredOrder : featuredOrder // ignore: cast_nullable_to_non_nullable
as int?,featuredImage: freezed == featuredImage ? _self.featuredImage : featuredImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  double price, @JsonKey(name: "discount_percent")  String discountPercent, @JsonKey(name: "discount_amount")  double discountAmount, @JsonKey(name: "discounted_price")  double discountPrice,  String image,  String category, @JsonKey(name: "is_featured")  bool? isFeatured, @JsonKey(name: "featured_order")  int? featuredOrder, @JsonKey(name: "featured_image")  String? featuredImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountPrice,_that.image,_that.category,_that.isFeatured,_that.featuredOrder,_that.featuredImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  double price, @JsonKey(name: "discount_percent")  String discountPercent, @JsonKey(name: "discount_amount")  double discountAmount, @JsonKey(name: "discounted_price")  double discountPrice,  String image,  String category, @JsonKey(name: "is_featured")  bool? isFeatured, @JsonKey(name: "featured_order")  int? featuredOrder, @JsonKey(name: "featured_image")  String? featuredImage)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountPrice,_that.image,_that.category,_that.isFeatured,_that.featuredOrder,_that.featuredImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  double price, @JsonKey(name: "discount_percent")  String discountPercent, @JsonKey(name: "discount_amount")  double discountAmount, @JsonKey(name: "discounted_price")  double discountPrice,  String image,  String category, @JsonKey(name: "is_featured")  bool? isFeatured, @JsonKey(name: "featured_order")  int? featuredOrder, @JsonKey(name: "featured_image")  String? featuredImage)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.discountPercent,_that.discountAmount,_that.discountPrice,_that.image,_that.category,_that.isFeatured,_that.featuredOrder,_that.featuredImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.title, required this.description, required this.price, @JsonKey(name: "discount_percent") required this.discountPercent, @JsonKey(name: "discount_amount") required this.discountAmount, @JsonKey(name: "discounted_price") required this.discountPrice, required this.image, required this.category, @JsonKey(name: "is_featured") this.isFeatured, @JsonKey(name: "featured_order") this.featuredOrder, @JsonKey(name: "featured_image") this.featuredImage});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  double price;
@override@JsonKey(name: "discount_percent") final  String discountPercent;
@override@JsonKey(name: "discount_amount") final  double discountAmount;
@override@JsonKey(name: "discounted_price") final  double discountPrice;
@override final  String image;
@override final  String category;
@override@JsonKey(name: "is_featured") final  bool? isFeatured;
@override@JsonKey(name: "featured_order") final  int? featuredOrder;
@override@JsonKey(name: "featured_image") final  String? featuredImage;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountPrice, discountPrice) || other.discountPrice == discountPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.featuredOrder, featuredOrder) || other.featuredOrder == featuredOrder)&&(identical(other.featuredImage, featuredImage) || other.featuredImage == featuredImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,price,discountPercent,discountAmount,discountPrice,image,category,isFeatured,featuredOrder,featuredImage);
}

@override
String toString() {
    return 'Product(id: $id, title: $title, description: $description, price: $price, discountPercent: $discountPercent, discountAmount: $discountAmount, discountPrice: $discountPrice, image: $image, category: $category, isFeatured: $isFeatured, featuredOrder: $featuredOrder, featuredImage: $featuredImage)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, double price,@JsonKey(name: "discount_percent") String discountPercent,@JsonKey(name: "discount_amount") double discountAmount,@JsonKey(name: "discounted_price") double discountPrice, String image, String category,@JsonKey(name: "is_featured") bool? isFeatured,@JsonKey(name: "featured_order") int? featuredOrder,@JsonKey(name: "featured_image") String? featuredImage
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,Object? discountPercent = null,Object? discountAmount = null,Object? discountPrice = null,Object? image = null,Object? category = null,Object? isFeatured = freezed,Object? featuredOrder = freezed,Object? featuredImage = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,discountPrice: null == discountPrice ? _self.discountPrice : discountPrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,isFeatured: freezed == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool?,featuredOrder: freezed == featuredOrder ? _self.featuredOrder : featuredOrder // ignore: cast_nullable_to_non_nullable
as int?,featuredImage: freezed == featuredImage ? _self.featuredImage : featuredImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
