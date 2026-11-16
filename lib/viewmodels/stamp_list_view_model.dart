import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import '../repositories/spot_repository.dart';

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

  Future<void> setCategory(String category) async {
    selectedCategory = category;

    //selectedPrefecture = 'すべて';

    prefectures = await spotRepository.getPrefecturesByCategory(category);

    if (!prefectures.contains(selectedPrefecture)) {
      selectedPrefecture = 'すべて';
    }

    filter();

    notifyListeners();
  }

  Future<void> setPrefecture(String prefecture) async {
    selectedPrefecture = prefecture;

    //selectedCategory = 'すべて';

    categories = await spotRepository.getCategoriesByPrefecture(prefecture);

    if (!categories.contains(selectedCategory)) {
      selectedCategory = 'すべて';
    }

    filter();

    notifyListeners();
  }

  Future<void> deleteStamp(int id) async {
    await repository.delete(id);

    await load();
  }
}
