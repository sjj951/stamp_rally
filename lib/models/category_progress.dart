import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_progress.freezed.dart';
part 'category_progress.g.dart';

enum BadgeRank { bronze, silver, gold, complete }

@freezed
abstract class CategoryProgress with _$CategoryProgress {
  const CategoryProgress._();
  const factory CategoryProgress({
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'acquired_count') required int acquiredCount,
  }) = _CategoryProgress;

  factory CategoryProgress.fromJson(Map<String, dynamic> json) =>
      _$CategoryProgressFromJson(json);

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
