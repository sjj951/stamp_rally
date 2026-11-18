// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryProgress {

@JsonKey(name: 'category') String get category;@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'acquired_count') int get acquiredCount;
/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProgressCopyWith<CategoryProgress> get copyWith => _$CategoryProgressCopyWithImpl<CategoryProgress>(this as CategoryProgress, _$identity);

  /// Serializes this CategoryProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CategoryProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProgress&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.totalCount, _this.totalCount) || other.totalCount == _this.totalCount)&&(identical(other.acquiredCount, _this.acquiredCount) || other.acquiredCount == _this.acquiredCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CategoryProgress;
  return Object.hash(runtimeType,_this.category,_this.totalCount,_this.acquiredCount);
}

@override
String toString() {
  final _this = this as CategoryProgress;
  return 'CategoryProgress(category: ${_this.category}, totalCount: ${_this.totalCount}, acquiredCount: ${_this.acquiredCount})';
}


}

/// @nodoc
abstract mixin class $CategoryProgressCopyWith<$Res>  {
  factory $CategoryProgressCopyWith(CategoryProgress value, $Res Function(CategoryProgress) _then) = _$CategoryProgressCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'category') String category,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'acquired_count') int acquiredCount
});




}
/// @nodoc
class _$CategoryProgressCopyWithImpl<$Res>
    implements $CategoryProgressCopyWith<$Res> {
  _$CategoryProgressCopyWithImpl(this._self, this._then);

  final CategoryProgress _self;
  final $Res Function(CategoryProgress) _then;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalCount = null,Object? acquiredCount = null,}) {
  return _then(CategoryProgress(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,acquiredCount: null == acquiredCount ? _self.acquiredCount : acquiredCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryProgress].
extension CategoryProgressPatterns on CategoryProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryProgress value)  $default,){
final _that = this;
switch (_that) {
case _CategoryProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryProgress value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'category')  String category, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'acquired_count')  int acquiredCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
return $default(_that.category,_that.totalCount,_that.acquiredCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'category')  String category, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'acquired_count')  int acquiredCount)  $default,) {final _that = this;
switch (_that) {
case _CategoryProgress():
return $default(_that.category,_that.totalCount,_that.acquiredCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'category')  String category, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'acquired_count')  int acquiredCount)?  $default,) {final _that = this;
switch (_that) {
case _CategoryProgress() when $default != null:
return $default(_that.category,_that.totalCount,_that.acquiredCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryProgress extends CategoryProgress {
  const _CategoryProgress({@JsonKey(name: 'category') required this.category, @JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'acquired_count') required this.acquiredCount}): super._();
  factory _CategoryProgress.fromJson(Map<String, dynamic> json) => _$CategoryProgressFromJson(json);

@override@JsonKey(name: 'category') final  String category;
@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'acquired_count') final  int acquiredCount;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryProgressCopyWith<_CategoryProgress> get copyWith => __$CategoryProgressCopyWithImpl<_CategoryProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryProgressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryProgress&&(identical(other.category, category) || other.category == category)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.acquiredCount, acquiredCount) || other.acquiredCount == acquiredCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,category,totalCount,acquiredCount);
}

@override
String toString() {
    return 'CategoryProgress(category: $category, totalCount: $totalCount, acquiredCount: $acquiredCount)';
}


}

/// @nodoc
abstract mixin class _$CategoryProgressCopyWith<$Res> implements $CategoryProgressCopyWith<$Res> {
  factory _$CategoryProgressCopyWith(_CategoryProgress value, $Res Function(_CategoryProgress) _then) = __$CategoryProgressCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'category') String category,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'acquired_count') int acquiredCount
});




}
/// @nodoc
class __$CategoryProgressCopyWithImpl<$Res>
    implements _$CategoryProgressCopyWith<$Res> {
  __$CategoryProgressCopyWithImpl(this._self, this._then);

  final _CategoryProgress _self;
  final $Res Function(_CategoryProgress) _then;

/// Create a copy of CategoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalCount = null,Object? acquiredCount = null,}) {
  return _then(_CategoryProgress(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,acquiredCount: null == acquiredCount ? _self.acquiredCount : acquiredCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
