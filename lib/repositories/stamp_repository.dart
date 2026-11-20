import '../database/database_helper.dart';
import '../models/stamp.dart';
import '../models/repository_result.dart';

class StampRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<RepositoryResult<List<Stamp>>> getAll() async {
    try {
      final stamps = await _db.getStamps();

      return RepositoryResult.success(stamps);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<int>> getCount() async {
    try {
      final count = await _db.getStampCount();
      return RepositoryResult.success(count);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<void>> insert(Stamp stamp) async {
    try {
      await _db.insertStamp(stamp);
      return RepositoryResult.success(null);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<void>> delete(int id) async {
    try {
      await _db.deleteStamp(id);
      return RepositoryResult.success(null);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<void>> updateFavorite(int id, bool favorite) async {
    try {
      await _db.updateFavorite(id, favorite);
      return RepositoryResult.success(null);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<void>> updateImage(int id, String imagePath) async {
    try {
      await _db.updateImage(id, imagePath);
      return RepositoryResult.success(null);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<bool>> exists(int spotId) async {
    try {
      final result = await _db.existsStamp(spotId);
      return RepositoryResult.success(result);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }
}
