import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_badge.freezed.dart';
part 'achievement_badge.g.dart';

@freezed
abstract class AchievementBadge with _$AchievementBadge {
  const factory AchievementBadge({
    int? id,

    required String badgeName,

    required String category,

    required int achievedPercent,

    required DateTime achievedAt,
  }) = _AchievementBadge;

  factory AchievementBadge.fromJson(Map<String, dynamic> json) =>
      _$AchievementBadgeFromJson(json);
}
