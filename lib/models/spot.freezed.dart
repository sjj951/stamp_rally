// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Spot {

 int get id;@JsonKey(name: 'spot_name') String get spotName; String get category; String get prefecture; String? get url; String? get comment;
/// Create a copy of Spot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpotCopyWith<Spot> get copyWith => _$SpotCopyWithImpl<Spot>(this as Spot, _$identity);

  /// Serializes this Spot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Spot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Spot&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.spotName, _this.spotName) || other.spotName == _this.spotName)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.prefecture, _this.prefecture) || other.prefecture == _this.prefecture)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Spot;
  return Object.hash(runtimeType,_this.id,_this.spotName,_this.category,_this.prefecture,_this.url,_this.comment);
}

@override
String toString() {
  final _this = this as Spot;
  return 'Spot(id: ${_this.id}, spotName: ${_this.spotName}, category: ${_this.category}, prefecture: ${_this.prefecture}, url: ${_this.url}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $SpotCopyWith<$Res>  {
  factory $SpotCopyWith(Spot value, $Res Function(Spot) _then) = _$SpotCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'spot_name') String spotName, String category, String prefecture, String? url, String? comment
});




}
/// @nodoc
class _$SpotCopyWithImpl<$Res>
    implements $SpotCopyWith<$Res> {
  _$SpotCopyWithImpl(this._self, this._then);

  final Spot _self;
  final $Res Function(Spot) _then;

/// Create a copy of Spot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spotName = null,Object? category = null,Object? prefecture = null,Object? url = freezed,Object? comment = freezed,}) {
  return _then(Spot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,spotName: null == spotName ? _self.spotName : spotName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Spot].
extension SpotPatterns on Spot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Spot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Spot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Spot value)  $default,){
final _that = this;
switch (_that) {
case _Spot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Spot value)?  $default,){
final _that = this;
switch (_that) {
case _Spot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String? url,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Spot() when $default != null:
return $default(_that.id,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String? url,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _Spot():
return $default(_that.id,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String? url,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _Spot() when $default != null:
return $default(_that.id,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Spot implements Spot {
  const _Spot({required this.id, @JsonKey(name: 'spot_name') required this.spotName, this.category = '', this.prefecture = '', this.url, this.comment});
  factory _Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

@override final  int id;
@override@JsonKey(name: 'spot_name') final  String spotName;
@override@JsonKey() final  String category;
@override@JsonKey() final  String prefecture;
@override final  String? url;
@override final  String? comment;

/// Create a copy of Spot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpotCopyWith<_Spot> get copyWith => __$SpotCopyWithImpl<_Spot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpotToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Spot&&(identical(other.id, id) || other.id == id)&&(identical(other.spotName, spotName) || other.spotName == spotName)&&(identical(other.category, category) || other.category == category)&&(identical(other.prefecture, prefecture) || other.prefecture == prefecture)&&(identical(other.url, url) || other.url == url)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,spotName,category,prefecture,url,comment);
}

@override
String toString() {
    return 'Spot(id: $id, spotName: $spotName, category: $category, prefecture: $prefecture, url: $url, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$SpotCopyWith<$Res> implements $SpotCopyWith<$Res> {
  factory _$SpotCopyWith(_Spot value, $Res Function(_Spot) _then) = __$SpotCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'spot_name') String spotName, String category, String prefecture, String? url, String? comment
});




}
/// @nodoc
class __$SpotCopyWithImpl<$Res>
    implements _$SpotCopyWith<$Res> {
  __$SpotCopyWithImpl(this._self, this._then);

  final _Spot _self;
  final $Res Function(_Spot) _then;

/// Create a copy of Spot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spotName = null,Object? category = null,Object? prefecture = null,Object? url = freezed,Object? comment = freezed,}) {
  return _then(_Spot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,spotName: null == spotName ? _self.spotName : spotName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
