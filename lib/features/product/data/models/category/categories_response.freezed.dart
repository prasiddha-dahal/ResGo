// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriesResponse {

 bool get success; List<Category> get data;
/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriesResponseCopyWith<CategoriesResponse> get copyWith => _$CategoriesResponseCopyWithImpl<CategoriesResponse>(this as CategoriesResponse, _$identity);

  /// Serializes this CategoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoriesResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriesResponse&&(identical(other.success, _this.success) || other.success == _this.success)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoriesResponse;
  return Object.hash(runtimeType,_this.success,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as CategoriesResponse;
  return 'CategoriesResponse(success: ${_this.success}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $CategoriesResponseCopyWith<$Res>  {
  factory $CategoriesResponseCopyWith(CategoriesResponse value, $Res Function(CategoriesResponse) _then) = _$CategoriesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<Category> data
});




}
/// @nodoc
class _$CategoriesResponseCopyWithImpl<$Res>
    implements $CategoriesResponseCopyWith<$Res> {
  _$CategoriesResponseCopyWithImpl(this._self, this._then);

  final CategoriesResponse _self;
  final $Res Function(CategoriesResponse) _then;

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,}) {
  return _then(CategoriesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriesResponse].
extension CategoriesResponsePatterns on CategoriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _CategoriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<Category> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<Category> data)  $default,) {final _that = this;
switch (_that) {
case _CategoriesResponse():
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<Category> data)?  $default,) {final _that = this;
switch (_that) {
case _CategoriesResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriesResponse implements CategoriesResponse {
  const _CategoriesResponse({required this.success, required  List<Category> data}): _data = data;
  factory _CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);

@override final  bool success;
 final  List<Category> _data;
@override List<Category> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriesResponseCopyWith<_CategoriesResponse> get copyWith => __$CategoriesResponseCopyWithImpl<_CategoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriesResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'CategoriesResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CategoriesResponseCopyWith<$Res> implements $CategoriesResponseCopyWith<$Res> {
  factory _$CategoriesResponseCopyWith(_CategoriesResponse value, $Res Function(_CategoriesResponse) _then) = __$CategoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<Category> data
});




}
/// @nodoc
class __$CategoriesResponseCopyWithImpl<$Res>
    implements _$CategoriesResponseCopyWith<$Res> {
  __$CategoriesResponseCopyWithImpl(this._self, this._then);

  final _CategoriesResponse _self;
  final $Res Function(_CategoriesResponse) _then;

/// Create a copy of CategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,}) {
  return _then(_CategoriesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}


}

// dart format on
