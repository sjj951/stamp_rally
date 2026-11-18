import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import '../repositories/spot_repository.dart';

import 'package:async/async.dart';

import '../models/filter_state.dart';

class StampListViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();
  final SpotRepository spotRepository = SpotRepository();
  List<Stamp> stamps = [];

  List<Stamp> filteredStamps = [];

  FilterState filters = const FilterState();

  List<String> categories = ['すべて'];
  List<String> prefectures = ['すべて'];

  int _requestId = 0;
  CancelableOperation<List<String>>? _categoryOperation;
  CancelableOperation<List<String>>? _prefectureOperation;
  bool isLoadingFilter = false;

  @override
  void dispose() {
    _categoryOperation?.cancel();
    _prefectureOperation?.cancel();

    super.dispose();
  }

  Future<void> load() async {
    stamps = await repository.getAll();
    categories = await spotRepository.getCategories();
    prefectures = await spotRepository.getPrefecturesByCategory(
      selectedCategory,
    );

    filter();

    notifyListeners();
  }

  void filter() {
    filteredStamps = stamps.where((stamp) {
      final matchName = stamp.spotName.toLowerCase().contains(
        searchText.toLowerCase(),
      );

      final matchFavorite = !favoriteOnly || stamp.favorite == 1;

      final matchCategory = selectedCategory == 'すべて'
          ? true
          : selectedCategory == 'カテゴリ未設定'
          ? stamp.category.isEmpty
          : stamp.category == selectedCategory;

      final matchPrefecture = selectedPrefecture == 'すべて'
          ? true
          : selectedPrefecture == '都道府県未設定'
          ? stamp.prefecture.isEmpty
          : stamp.prefecture == selectedPrefecture;

      return matchName && matchFavorite && matchCategory && matchPrefecture;
    }).toList();
  }

  String get searchText => filters.searchText;

  bool get favoriteOnly => filters.favoriteOnly;

  String get selectedCategory => filters.category;

  String get selectedPrefecture => filters.prefecture;

  void setSearchText(String value) {
    final newState = filters.copyWith(searchText: value);

    if (newState == filters) {
      return;
    }

    filters = newState;

    filter();

    notifyListeners();
  }

  void setFavoriteOnly(bool value) {
    final newState = filters.copyWith(favoriteOnly: value);

    if (newState == filters) {
      return;
    }

    filters = newState;

    filter();

    notifyListeners();
  }

  void setSelectedCategory(String value) {
    final newState = filters.copyWith(category: value);

    if (newState == filters) {
      return;
    }

    filters = newState;

    filter();

    notifyListeners();
  }

  Future<void> setCategory(String value) async {
    final requestId = ++_requestId;

    isLoadingFilter = true;
    notifyListeners();

    final newState = filters.copyWith(category: value);

    if (newState == filters) {
      return;
    }

    filters = newState;

    await _prefectureOperation?.cancel();

    _prefectureOperation = CancelableOperation.fromFuture(
      spotRepository.getPrefecturesByCategory(selectedCategory),
    );

    try {
      final result = await _prefectureOperation!.valueOrCancellation();

      if (result == null) {
        return;
      }

      if (requestId != _requestId) {
        return;
      }

      prefectures = result;

      if (!prefectures.contains(selectedPrefecture)) {
        filters = filters.copyWith(prefecture: 'すべて');
      }

      filter();
    } finally {
      if (requestId == _requestId) {
        isLoadingFilter = false;
        notifyListeners();
      }
    }
  }

  Future<void> setPrefecture(String value) async {
    final requestId = ++_requestId;

    isLoadingFilter = true;
    notifyListeners();

    final newState = filters.copyWith(prefecture: value);

    if (newState == filters) {
      return;
    }

    filters = newState;

    await _categoryOperation?.cancel();

    _categoryOperation = CancelableOperation.fromFuture(
      spotRepository.getCategoriesByPrefecture(selectedPrefecture),
    );

    try {
      final result = await _categoryOperation!.valueOrCancellation();

      if (result == null) {
        return;
      }

      if (requestId != _requestId) {
        return;
      }

      categories = result;

      if (!categories.contains(selectedCategory)) {
        filters = filters.copyWith(category: 'すべて');
      }

      filter();
    } finally {
      if (requestId == _requestId) {
        isLoadingFilter = false;
        notifyListeners();
      }
    }
  }

  Future<void> deleteStamp(int id) async {
    await repository.delete(id);

    await load();
  }
}
