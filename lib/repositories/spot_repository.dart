import '../database/database_helper.dart';
import '../models/spot.dart';
import '../models/category_progress.dart';
import '../models/repository_result.dart';

class SpotRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<RepositoryResult<List<Spot>>> getAll() async {
    try {
      final spots = await _db.getSpots();
      return RepositoryResult.success(spots);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<String>>> getCategories() async {
    try {
      final categories = await _db.getCategories();
      return RepositoryResult.success(categories);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<CategoryProgress>>> getCategoryProgress() async {
    try {
      final progress = await _db.getCategoryProgress();
      return RepositoryResult.success(progress);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<Spot>>> getMissingSpots() async {
    try {
      final spots = await _db.getMissingSpots();
      return RepositoryResult.success(spots);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<String>>> getPrefectures() async {
    try {
      final prefectures = await _db.getPrefectures();
      return RepositoryResult.success(prefectures);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<String>>> getPrefecturesByCategory(
    String category,
  ) async {
    try {
      final prefectures = await _db.getPrefecturesByCategory(category);
      return RepositoryResult.success(prefectures);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<String>>> getCategoriesByPrefecture(
    String prefecture,
  ) async {
    try {
      final categories = await _db.getCategoriesByPrefecture(prefecture);
      return RepositoryResult.success(categories);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<Spot>>> getMissingSpotsByCategory(
    String category,
  ) async {
    try {
      final spots = await _db.getMissingSpotsByCategory(category);
      return RepositoryResult.success(spots);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<List<Spot>>> getCompletedSpotsByCategory(
    String category,
  ) async {
    try {
      final result = await _db.getCompletedSpotsByCategory(category);

      return RepositoryResult.success(result);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }
}
