import 'package:flutter/foundation.dart';

@immutable
class FilterState {
  final String searchText;

  final bool favoriteOnly;

  final String category;

  final String prefecture;

  const FilterState({
    this.searchText = '',
    this.favoriteOnly = false,
    this.category = 'すべて',
    this.prefecture = 'すべて',
  });

  FilterState copyWith({
    String? searchText,
    bool? favoriteOnly,
    String? category,
    String? prefecture,
  }) {
    return FilterState(
      searchText: searchText ?? this.searchText,

      favoriteOnly: favoriteOnly ?? this.favoriteOnly,

      category: category ?? this.category,

      prefecture: prefecture ?? this.prefecture,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FilterState &&
            searchText == other.searchText &&
            favoriteOnly == other.favoriteOnly &&
            category == other.category &&
            prefecture == other.prefecture;
  }

  @override
  int get hashCode =>
      Object.hash(searchText, favoriteOnly, category, prefecture);

  @override
  String toString() {
    return 'FilterState('
        'searchText: $searchText, '
        'favoriteOnly: $favoriteOnly, '
        'category: $category, '
        'prefecture: $prefecture'
        ')';
  }
}
