// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementBadge {

 int? get id; String get badgeName; String get category; int get achievedPercent; DateTime get achievedAt; String get description;
/// Create a copy of AchievementBadge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementBadgeCopyWith<AchievementBadge> get copyWith => _$AchievementBadgeCopyWithImpl<AchievementBadge>(this as AchievementBadge, _$identity);

  /// Serializes this AchievementBadge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AchievementBadge;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementBadge&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.badgeName, _this.badgeName) || other.badgeName == _this.badgeName)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.achievedPercent, _this.achievedPercent) || other.achievedPercent == _this.achievedPercent)&&(identical(other.achievedAt, _this.achievedAt) || other.achievedAt == _this.achievedAt)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AchievementBadge;
  return Object.hash(runtimeType,_this.id,_this.badgeName,_this.category,_this.achievedPercent,_this.achievedAt,_this.description);
}

@override
String toString() {
  final _this = this as AchievementBadge;
  return 'AchievementBadge(id: ${_this.id}, badgeName: ${_this.badgeName}, category: ${_this.category}, achievedPercent: ${_this.achievedPercent}, achievedAt: ${_this.achievedAt}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $AchievementBadgeCopyWith<$Res>  {
  factory $AchievementBadgeCopyWith(AchievementBadge value, $Res Function(AchievementBadge) _then) = _$AchievementBadgeCopyWithImpl;
@useResult
$Res call({
 int? id, String badgeName, String category, int achievedPercent, DateTime achievedAt, String description
});




}
/// @nodoc
class _$AchievementBadgeCopyWithImpl<$Res>
    implements $AchievementBadgeCopyWith<$Res> {
  _$AchievementBadgeCopyWithImpl(this._self, this._then);

  final AchievementBadge _self;
  final $Res Function(AchievementBadge) _then;

/// Create a copy of AchievementBadge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? badgeName = null,Object? category = null,Object? achievedPercent = null,Object? achievedAt = null,Object? description = null,}) {
  return _then(AchievementBadge(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,badgeName: null == badgeName ? _self.badgeName : badgeName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,achievedPercent: null == achievedPercent ? _self.achievedPercent : achievedPercent // ignore: cast_nullable_to_non_nullable
as int,achievedAt: null == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementBadge].
extension AchievementBadgePatterns on AchievementBadge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementBadge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementBadge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementBadge value)  $default,){
final _that = this;
switch (_that) {
case _AchievementBadge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementBadge value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementBadge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String badgeName,  String category,  int achievedPercent,  DateTime achievedAt,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementBadge() when $default != null:
return $default(_that.id,_that.badgeName,_that.category,_that.achievedPercent,_that.achievedAt,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String badgeName,  String category,  int achievedPercent,  DateTime achievedAt,  String description)  $default,) {final _that = this;
switch (_that) {
case _AchievementBadge():
return $default(_that.id,_that.badgeName,_that.category,_that.achievedPercent,_that.achievedAt,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String badgeName,  String category,  int achievedPercent,  DateTime achievedAt,  String description)?  $default,) {final _that = this;
switch (_that) {
case _AchievementBadge() when $default != null:
return $default(_that.id,_that.badgeName,_that.category,_that.achievedPercent,_that.achievedAt,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementBadge implements AchievementBadge {
  const _AchievementBadge({this.id, required this.badgeName, required this.category, required this.achievedPercent, required this.achievedAt, this.description = ''});
  factory _AchievementBadge.fromJson(Map<String, dynamic> json) => _$AchievementBadgeFromJson(json);

@override final  int? id;
@override final  String badgeName;
@override final  String category;
@override final  int achievedPercent;
@override final  DateTime achievedAt;
@override@JsonKey() final  String description;

/// Create a copy of AchievementBadge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementBadgeCopyWith<_AchievementBadge> get copyWith => __$AchievementBadgeCopyWithImpl<_AchievementBadge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementBadgeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementBadge&&(identical(other.id, id) || other.id == id)&&(identical(other.badgeName, badgeName) || other.badgeName == badgeName)&&(identical(other.category, category) || other.category == category)&&(identical(other.achievedPercent, achievedPercent) || other.achievedPercent == achievedPercent)&&(identical(other.achievedAt, achievedAt) || other.achievedAt == achievedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,badgeName,category,achievedPercent,achievedAt,description);
}

@override
String toString() {
    return 'AchievementBadge(id: $id, badgeName: $badgeName, category: $category, achievedPercent: $achievedPercent, achievedAt: $achievedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$AchievementBadgeCopyWith<$Res> implements $AchievementBadgeCopyWith<$Res> {
  factory _$AchievementBadgeCopyWith(_AchievementBadge value, $Res Function(_AchievementBadge) _then) = __$AchievementBadgeCopyWithImpl;
@override @useResult
$Res call({
 int? id, String badgeName, String category, int achievedPercent, DateTime achievedAt, String description
});




}
/// @nodoc
class __$AchievementBadgeCopyWithImpl<$Res>
    implements _$AchievementBadgeCopyWith<$Res> {
  __$AchievementBadgeCopyWithImpl(this._self, this._then);

  final _AchievementBadge _self;
  final $Res Function(_AchievementBadge) _then;

/// Create a copy of AchievementBadge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? badgeName = null,Object? category = null,Object? achievedPercent = null,Object? achievedAt = null,Object? description = null,}) {
  return _then(_AchievementBadge(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,badgeName: null == badgeName ? _self.badgeName : badgeName // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,achievedPercent: null == achievedPercent ? _self.achievedPercent : achievedPercent // ignore: cast_nullable_to_non_nullable
as int,achievedAt: null == achievedAt ? _self.achievedAt : achievedAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
