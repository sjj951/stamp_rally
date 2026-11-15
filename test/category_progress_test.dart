import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_rally/models/category_progress.dart';

void main() {
  group('CategoryProgress', () {
    test('assigns badges by progress and marks completed categories', () {
      expect(
        const CategoryProgress(
          category: '城',
          totalCount: 10,
          acquiredCount: 4,
        ).badgeRank,
        BadgeRank.bronze,
      );
      expect(
        const CategoryProgress(
          category: '城',
          totalCount: 10,
          acquiredCount: 5,
        ).badgeRank,
        BadgeRank.silver,
      );
      expect(
        const CategoryProgress(
          category: '城',
          totalCount: 10,
          acquiredCount: 8,
        ).badgeRank,
        BadgeRank.gold,
      );

      const completed = CategoryProgress(
        category: '城',
        totalCount: 10,
        acquiredCount: 10,
      );
      expect(completed.badgeRank, BadgeRank.complete);
      expect(completed.isCompleted, isTrue);
    });

    test('does not mark an empty category as completed', () {
      const progress = CategoryProgress(
        category: '城',
        totalCount: 0,
        acquiredCount: 0,
      );

      expect(progress.badgeRank, BadgeRank.bronze);
      expect(progress.isCompleted, isFalse);
    });
  });
}
