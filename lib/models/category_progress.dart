import 'package:flutter/material.dart';

enum BadgeRank { bronze, silver, gold, complete }

class CategoryProgress {
  final String category;
  final int totalCount;
  final int acquiredCount;

  const CategoryProgress({
    required this.category,
    required this.totalCount,
    required this.acquiredCount,
  });

  factory CategoryProgress.fromMap(Map<String, dynamic> map) {
    return CategoryProgress(
      category: map['category'] as String,
      totalCount: map['total_count'] as int,
      acquiredCount: map['acquired_count'] as int,
    );
  }

  double get progressRate {
    if (totalCount == 0) {
      return 0;
    }

    return acquiredCount / totalCount;
  }

  int get progressPercent {
    return (progressRate * 100).round();
  }

  bool get isCompleted {
    return totalCount > 0 && acquiredCount >= totalCount;
  }

  /// COMPLETE のときだけ紙吹雪
  bool get shouldShowConfetti {
    return badgeRank == BadgeRank.complete;
  }

  BadgeRank get badgeRank {
    if (isCompleted) {
      return BadgeRank.complete;
    } else if (progressPercent >= 80) {
      return BadgeRank.gold;
    } else if (progressPercent >= 50) {
      return BadgeRank.silver;
    } else {
      return BadgeRank.bronze;
    }
  }

  IconData get badgeIcon {
    switch (badgeRank) {
      case BadgeRank.bronze:
        return Icons.local_fire_department;
      case BadgeRank.silver:
        return Icons.local_activity;
      case BadgeRank.gold:
        return Icons.star;
      case BadgeRank.complete:
        return Icons.workspace_premium;
    }
  }

  Color get badgeColor {
    switch (badgeRank) {
      case BadgeRank.bronze:
        return Colors.brown;
      case BadgeRank.silver:
        return Colors.grey;
      case BadgeRank.gold:
        return Colors.amber;
      case BadgeRank.complete:
        return Colors.amber.shade200;
    }
  }

  bool becameCompleted(CategoryProgress previous) {
    return !previous.isCompleted && isCompleted;
  }

  String get badgeLabel {
    switch (badgeRank) {
      case BadgeRank.complete:
        return '🏆 COMPLETE';

      case BadgeRank.gold:
        return '🥇 GOLD';

      case BadgeRank.silver:
        return '🥈 SILVER';

      case BadgeRank.bronze:
        return '🥉 BRONZE';
    }
  }
}
