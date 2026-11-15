import '../database/database_helper.dart';
import '../models/spot.dart';
import '../models/category_progress.dart';

class SpotRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<List<Spot>> getAll() async {
    return await _db.getSpots();
  }

  Future<List<String>> getCategories() async {
    return await _db.getCategories();
  }

  Future<List<CategoryProgress>> getCategoryProgress() async {
    return await _db.getCategoryProgress();
  }

  Future<List<Spot>> getMissingSpots() async {
    return await _db.getMissingSpots();
  }

  Future<List<String>> getPrefectures() async {
    return await _db.getPrefectures();
  }

  Future<List<Spot>> getMissingSpotsByCategory(String category) async {
    return await _db.getMissingSpotsByCategory(category);
  }
}
