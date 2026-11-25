import '../models/achievement_badge.dart';
import '../models/category_progress.dart';
import '../repositories/badge_repository.dart';
import '../repositories/spot_repository.dart';
import '../models/repository_result.dart';

class BadgeService {
  final BadgeRepository _badgeRepository = BadgeRepository();

  final SpotRepository _spotRepository = SpotRepository();

  Future<List<AchievementBadge>> checkAndUnlockBadges() async {
    final unlockedBadges = <AchievementBadge>[];

    final progressResult = await _spotRepository.getCategoryProgress();

    await progressResult.when(
      success: (progressList) async {
        for (final progress in progressList) {
          final badge = await _checkBadge(progress);

          if (badge != null) {
            unlockedBadges.add(badge);
          }
        }
      },

      failure: (_) {},
    );

    return unlockedBadges;
  }

  Future<AchievementBadge?> _checkBadge(CategoryProgress progress) async {
    final badgeName = progress.badgeRank.name;

    final existsResult = await _badgeRepository.badgeExists(
      badgeName,
      progress.category,
    );

    final exists = existsResult.when(
      success: (value) => value,
      failure: (_) => true,
    );

    if (exists) {
      return null;
    }

    final badge = AchievementBadge(
      badgeName: badgeName,
      category: progress.category,
      achievedPercent: progress.progressPercent,
      achievedAt: DateTime.now(),
    );

    final insertResult = await _badgeRepository.insertBadge(badge);

    return insertResult.when(success: (_) => badge, failure: (_) => null);
  }
}
