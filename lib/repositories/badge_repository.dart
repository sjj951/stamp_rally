import '../database/database_helper.dart';
import '../models/achievement_badge.dart';
import '../models/repository_result.dart';

class BadgeRepository {
  final DatabaseHelper _db = DatabaseHelper.instance;

  Future<RepositoryResult<List<AchievementBadge>>> getBadges() async {
    try {
      final badges = await _db.getBadges();

      return RepositoryResult.success(badges);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<void>> insertBadge(AchievementBadge badge) async {
    try {
      await _db.insertBadge(badge);

      return const RepositoryResult.success(null);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }

  Future<RepositoryResult<bool>> badgeExists(
    String badgeName,
    String category,
  ) async {
    try {
      final exists = await _db.badgeExists(badgeName, category);

      return RepositoryResult.success(exists);
    } catch (e) {
      return RepositoryResult.failure(e.toString());
    }
  }
}
