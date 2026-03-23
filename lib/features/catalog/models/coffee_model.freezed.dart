// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoffeeModel {

 String get id; String get name; String get description; double get price; String get imageUrl;
/// Create a copy of CoffeeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoffeeModelCopyWith<CoffeeModel> get copyWith => _$CoffeeModelCopyWithImpl<CoffeeModel>(this as CoffeeModel, _$identity);

  /// Serializes this CoffeeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoffeeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl);

@override
String toString() {
  return 'CoffeeModel(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CoffeeModelCopyWith<$Res>  {
  factory $CoffeeModelCopyWith(CoffeeModel value, $Res Function(CoffeeModel) _then) = _$CoffeeModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double price, String imageUrl
});




}
/// @nodoc
class _$CoffeeModelCopyWithImpl<$Res>
    implements $CoffeeModelCopyWith<$Res> {
  _$CoffeeModelCopyWithImpl(this._self, this._then);

  final CoffeeModel _self;
  final $Res Function(CoffeeModel) _then;

/// Create a copy of CoffeeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CoffeeModel].
extension CoffeeModelPatterns on CoffeeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoffeeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoffeeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoffeeModel value)  $default,){
final _that = this;
switch (_that) {
case _CoffeeModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoffeeModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoffeeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoffeeModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _CoffeeModel():
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double price,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _CoffeeModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoffeeModel implements CoffeeModel {
  const _CoffeeModel({required this.id, required this.name, required this.description, required this.price, required this.imageUrl});
  factory _CoffeeModel.fromJson(Map<String, dynamic> json) => _$CoffeeModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double price;
@override final  String imageUrl;

/// Create a copy of CoffeeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoffeeModelCopyWith<_CoffeeModel> get copyWith => __$CoffeeModelCopyWithImpl<_CoffeeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoffeeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoffeeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,imageUrl);

@override
String toString() {
  return 'CoffeeModel(id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$CoffeeModelCopyWith<$Res> implements $CoffeeModelCopyWith<$Res> {
  factory _$CoffeeModelCopyWith(_CoffeeModel value, $Res Function(_CoffeeModel) _then) = __$CoffeeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double price, String imageUrl
});




}
/// @nodoc
class __$CoffeeModelCopyWithImpl<$Res>
    implements _$CoffeeModelCopyWith<$Res> {
  __$CoffeeModelCopyWithImpl(this._self, this._then);

  final _CoffeeModel _self;
  final $Res Function(_CoffeeModel) _then;

/// Create a copy of CoffeeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? imageUrl = null,}) {
  return _then(_CoffeeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
