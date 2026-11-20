// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stamp {

 int? get id;@JsonKey(name: 'spot_id') int get spotId;@JsonKey(name: 'spot_name') String get spotName; String get category; String get prefecture; String get url; String get comment;@JsonKey(name: 'image_path') String? get imagePath;@SqliteBoolConverter() bool get favorite;@JsonKey(name: 'scan_date')@SqliteDateTimeConverter() DateTime get scanDate;
/// Create a copy of Stamp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StampCopyWith<Stamp> get copyWith => _$StampCopyWithImpl<Stamp>(this as Stamp, _$identity);

  /// Serializes this Stamp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Stamp;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stamp&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.spotId, _this.spotId) || other.spotId == _this.spotId)&&(identical(other.spotName, _this.spotName) || other.spotName == _this.spotName)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.prefecture, _this.prefecture) || other.prefecture == _this.prefecture)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.comment, _this.comment) || other.comment == _this.comment)&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.favorite, _this.favorite) || other.favorite == _this.favorite)&&(identical(other.scanDate, _this.scanDate) || other.scanDate == _this.scanDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Stamp;
  return Object.hash(runtimeType,_this.id,_this.spotId,_this.spotName,_this.category,_this.prefecture,_this.url,_this.comment,_this.imagePath,_this.favorite,_this.scanDate);
}

@override
String toString() {
  final _this = this as Stamp;
  return 'Stamp(id: ${_this.id}, spotId: ${_this.spotId}, spotName: ${_this.spotName}, category: ${_this.category}, prefecture: ${_this.prefecture}, url: ${_this.url}, comment: ${_this.comment}, imagePath: ${_this.imagePath}, favorite: ${_this.favorite}, scanDate: ${_this.scanDate})';
}


}

/// @nodoc
abstract mixin class $StampCopyWith<$Res>  {
  factory $StampCopyWith(Stamp value, $Res Function(Stamp) _then) = _$StampCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'spot_id') int spotId,@JsonKey(name: 'spot_name') String spotName, String category, String prefecture, String url, String comment,@JsonKey(name: 'image_path') String? imagePath,@SqliteBoolConverter() bool favorite,@JsonKey(name: 'scan_date')@SqliteDateTimeConverter() DateTime scanDate
});




}
/// @nodoc
class _$StampCopyWithImpl<$Res>
    implements $StampCopyWith<$Res> {
  _$StampCopyWithImpl(this._self, this._then);

  final Stamp _self;
  final $Res Function(Stamp) _then;

/// Create a copy of Stamp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? spotId = null,Object? spotName = null,Object? category = null,Object? prefecture = null,Object? url = null,Object? comment = null,Object? imagePath = freezed,Object? favorite = null,Object? scanDate = null,}) {
  return _then(Stamp(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,spotId: null == spotId ? _self.spotId : spotId // ignore: cast_nullable_to_non_nullable
as int,spotName: null == spotName ? _self.spotName : spotName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,scanDate: null == scanDate ? _self.scanDate : scanDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Stamp].
extension StampPatterns on Stamp {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stamp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stamp() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stamp value)  $default,){
final _that = this;
switch (_that) {
case _Stamp():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stamp value)?  $default,){
final _that = this;
switch (_that) {
case _Stamp() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'spot_id')  int spotId, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String url,  String comment, @JsonKey(name: 'image_path')  String? imagePath, @SqliteBoolConverter()  bool favorite, @JsonKey(name: 'scan_date')@SqliteDateTimeConverter()  DateTime scanDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stamp() when $default != null:
return $default(_that.id,_that.spotId,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment,_that.imagePath,_that.favorite,_that.scanDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'spot_id')  int spotId, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String url,  String comment, @JsonKey(name: 'image_path')  String? imagePath, @SqliteBoolConverter()  bool favorite, @JsonKey(name: 'scan_date')@SqliteDateTimeConverter()  DateTime scanDate)  $default,) {final _that = this;
switch (_that) {
case _Stamp():
return $default(_that.id,_that.spotId,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment,_that.imagePath,_that.favorite,_that.scanDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'spot_id')  int spotId, @JsonKey(name: 'spot_name')  String spotName,  String category,  String prefecture,  String url,  String comment, @JsonKey(name: 'image_path')  String? imagePath, @SqliteBoolConverter()  bool favorite, @JsonKey(name: 'scan_date')@SqliteDateTimeConverter()  DateTime scanDate)?  $default,) {final _that = this;
switch (_that) {
case _Stamp() when $default != null:
return $default(_that.id,_that.spotId,_that.spotName,_that.category,_that.prefecture,_that.url,_that.comment,_that.imagePath,_that.favorite,_that.scanDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stamp implements Stamp {
  const _Stamp({this.id, @JsonKey(name: 'spot_id') required this.spotId, @JsonKey(name: 'spot_name') required this.spotName, this.category = '', this.prefecture = '', this.url = '', this.comment = '', @JsonKey(name: 'image_path') this.imagePath, @SqliteBoolConverter() this.favorite = false, @JsonKey(name: 'scan_date')@SqliteDateTimeConverter() required this.scanDate});
  factory _Stamp.fromJson(Map<String, dynamic> json) => _$StampFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'spot_id') final  int spotId;
@override@JsonKey(name: 'spot_name') final  String spotName;
@override@JsonKey() final  String category;
@override@JsonKey() final  String prefecture;
@override@JsonKey() final  String url;
@override@JsonKey() final  String comment;
@override@JsonKey(name: 'image_path') final  String? imagePath;
@override@JsonKey()@SqliteBoolConverter() final  bool favorite;
@override@JsonKey(name: 'scan_date')@SqliteDateTimeConverter() final  DateTime scanDate;

/// Create a copy of Stamp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StampCopyWith<_Stamp> get copyWith => __$StampCopyWithImpl<_Stamp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StampToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stamp&&(identical(other.id, id) || other.id == id)&&(identical(other.spotId, spotId) || other.spotId == spotId)&&(identical(other.spotName, spotName) || other.spotName == spotName)&&(identical(other.category, category) || other.category == category)&&(identical(other.prefecture, prefecture) || other.prefecture == prefecture)&&(identical(other.url, url) || other.url == url)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.scanDate, scanDate) || other.scanDate == scanDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,spotId,spotName,category,prefecture,url,comment,imagePath,favorite,scanDate);
}

@override
String toString() {
    return 'Stamp(id: $id, spotId: $spotId, spotName: $spotName, category: $category, prefecture: $prefecture, url: $url, comment: $comment, imagePath: $imagePath, favorite: $favorite, scanDate: $scanDate)';
}


}

/// @nodoc
abstract mixin class _$StampCopyWith<$Res> implements $StampCopyWith<$Res> {
  factory _$StampCopyWith(_Stamp value, $Res Function(_Stamp) _then) = __$StampCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'spot_id') int spotId,@JsonKey(name: 'spot_name') String spotName, String category, String prefecture, String url, String comment,@JsonKey(name: 'image_path') String? imagePath,@SqliteBoolConverter() bool favorite,@JsonKey(name: 'scan_date')@SqliteDateTimeConverter() DateTime scanDate
});




}
/// @nodoc
class __$StampCopyWithImpl<$Res>
    implements _$StampCopyWith<$Res> {
  __$StampCopyWithImpl(this._self, this._then);

  final _Stamp _self;
  final $Res Function(_Stamp) _then;

/// Create a copy of Stamp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? spotId = null,Object? spotName = null,Object? category = null,Object? prefecture = null,Object? url = null,Object? comment = null,Object? imagePath = freezed,Object? favorite = null,Object? scanDate = null,}) {
  return _then(_Stamp(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,spotId: null == spotId ? _self.spotId : spotId // ignore: cast_nullable_to_non_nullable
as int,spotName: null == spotName ? _self.spotName : spotName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as bool,scanDate: null == scanDate ? _self.scanDate : scanDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
