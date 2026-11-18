import '../database/database_helper.dart';
import '../models/stamp.dart';

class StampRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<List<Stamp>> getAll() async {
    return await _db.getStamps();
  }

  Future<int> getCount() async {
    return await _db.getStampCount();
  }

  Future<void> insert(Stamp stamp) async {
    await _db.insertStamp(stamp);
  }

  Future<void> delete(int id) async {
    await _db.deleteStamp(id);
  }

  Future<void> updateFavorite(int id, bool favorite) async {
    await _db.updateFavorite(id, favorite);
  }

  Future<void> updateImage(int id, String imagePath) async {
    await _db.updateImage(id, imagePath);
  }

  Future<bool> exists(int spotId) async {
    return await _db.existsStamp(spotId);
  }
}
