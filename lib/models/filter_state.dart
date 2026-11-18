import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
abstract class FilterState with _$FilterState {
  const factory FilterState({
    @Default('') String searchText,

    @Default(false) bool favoriteOnly,

    @Default('すべて') String category,

    @Default('すべて') String prefecture,
  }) = _FilterState;
}
