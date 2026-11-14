import '../database/database_helper.dart';
//import '../models/spot.dart';

class SpotRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;
  /*
  Future<List<Spot>> getAll() async {
    //return await _db.getSpots();
  }
*/
  Future<List<Map<String, dynamic>>> getCategoryProgress() async {
    return await _db.getCategoryProgress();
  }

  Future<List<Map<String, dynamic>>> getMissingSpots() async {
    return await _db.getMissingSpots();
  }

  Future<List<Map<String, dynamic>>> getMissingSpotsByCategory(
    String category,
  ) async {
    return await _db.getMissingSpotsByCategory(category);
  }
}
