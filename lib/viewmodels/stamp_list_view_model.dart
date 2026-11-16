import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import '../repositories/spot_repository.dart';

import 'package:async/async.dart';

class StampListViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();
  final SpotRepository spotRepository = SpotRepository();
  List<Stamp> stamps = [];

  List<Stamp> filteredStamps = [];

  bool favoriteOnly = false;

  String searchText = '';
  String selectedCategory = 'すべて';
  List<String> categories = ['すべて'];
  List<String> prefectures = ['すべて'];
  String selectedPrefecture = 'すべて';
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
          : selectedPrefecture == '都道府県未設定';
      //? stamp.prefecture.isEmpty
      //: stamp.prefecture == selectedPrefecture;

      return matchName && matchFavorite && matchCategory && matchPrefecture;
    }).toList();
  }

  void setSearchText(String value) {
    searchText = value;

    filter();

    notifyListeners();
  }

  void setFavoriteOnly(bool value) {
    favoriteOnly = value;

    filter();

    notifyListeners();
  }

  void setSelectedCategory(String value) {
    selectedCategory = value;

    filter();

    notifyListeners();
  }

  Future<void> setCategory(String value) async {
    final requestId = ++_requestId;

    isLoadingFilter = true;
    notifyListeners();

    selectedCategory = value;

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
        selectedPrefecture = 'すべて';
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

    selectedPrefecture = value;

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
        selectedCategory = 'すべて';
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
