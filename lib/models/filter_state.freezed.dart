// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {

 String get searchText; bool get favoriteOnly; String get category; String get prefecture;
/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterStateCopyWith<FilterState> get copyWith => _$FilterStateCopyWithImpl<FilterState>(this as FilterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FilterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState&&(identical(other.searchText, _this.searchText) || other.searchText == _this.searchText)&&(identical(other.favoriteOnly, _this.favoriteOnly) || other.favoriteOnly == _this.favoriteOnly)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.prefecture, _this.prefecture) || other.prefecture == _this.prefecture));
}


@override
int get hashCode {
  final _this = this as FilterState;
  return Object.hash(runtimeType,_this.searchText,_this.favoriteOnly,_this.category,_this.prefecture);
}

@override
String toString() {
  final _this = this as FilterState;
  return 'FilterState(searchText: ${_this.searchText}, favoriteOnly: ${_this.favoriteOnly}, category: ${_this.category}, prefecture: ${_this.prefecture})';
}


}

/// @nodoc
abstract mixin class $FilterStateCopyWith<$Res>  {
  factory $FilterStateCopyWith(FilterState value, $Res Function(FilterState) _then) = _$FilterStateCopyWithImpl;
@useResult
$Res call({
 String searchText, bool favoriteOnly, String category, String prefecture
});




}
/// @nodoc
class _$FilterStateCopyWithImpl<$Res>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._self, this._then);

  final FilterState _self;
  final $Res Function(FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchText = null,Object? favoriteOnly = null,Object? category = null,Object? prefecture = null,}) {
  return _then(FilterState(
searchText: null == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String,favoriteOnly: null == favoriteOnly ? _self.favoriteOnly : favoriteOnly // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterState value)  $default,){
final _that = this;
switch (_that) {
case _FilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterState value)?  $default,){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchText,  bool favoriteOnly,  String category,  String prefecture)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.searchText,_that.favoriteOnly,_that.category,_that.prefecture);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchText,  bool favoriteOnly,  String category,  String prefecture)  $default,) {final _that = this;
switch (_that) {
case _FilterState():
return $default(_that.searchText,_that.favoriteOnly,_that.category,_that.prefecture);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchText,  bool favoriteOnly,  String category,  String prefecture)?  $default,) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.searchText,_that.favoriteOnly,_that.category,_that.prefecture);case _:
  return null;

}
}

}

/// @nodoc


class _FilterState implements FilterState {
  const _FilterState({this.searchText = '', this.favoriteOnly = false, this.category = 'すべて', this.prefecture = 'すべて'});
  

@override@JsonKey() final  String searchText;
@override@JsonKey() final  bool favoriteOnly;
@override@JsonKey() final  String category;
@override@JsonKey() final  String prefecture;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterStateCopyWith<_FilterState> get copyWith => __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterState&&(identical(other.searchText, searchText) || other.searchText == searchText)&&(identical(other.favoriteOnly, favoriteOnly) || other.favoriteOnly == favoriteOnly)&&(identical(other.category, category) || other.category == category)&&(identical(other.prefecture, prefecture) || other.prefecture == prefecture));
}


@override
int get hashCode {
    return Object.hash(runtimeType,searchText,favoriteOnly,category,prefecture);
}

@override
String toString() {
    return 'FilterState(searchText: $searchText, favoriteOnly: $favoriteOnly, category: $category, prefecture: $prefecture)';
}


}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(_FilterState value, $Res Function(_FilterState) _then) = __$FilterStateCopyWithImpl;
@override @useResult
$Res call({
 String searchText, bool favoriteOnly, String category, String prefecture
});




}
/// @nodoc
class __$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchText = null,Object? favoriteOnly = null,Object? category = null,Object? prefecture = null,}) {
  return _then(_FilterState(
searchText: null == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String,favoriteOnly: null == favoriteOnly ? _self.favoriteOnly : favoriteOnly // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,prefecture: null == prefecture ? _self.prefecture : prefecture // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
