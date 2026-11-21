// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AchievementBadge _$AchievementBadgeFromJson(Map<String, dynamic> json) =>
    _AchievementBadge(
      id: (json['id'] as num?)?.toInt(),
      badgeName: json['badgeName'] as String,
      category: json['category'] as String,
      achievedPercent: (json['achievedPercent'] as num).toInt(),
      achievedAt: DateTime.parse(json['achievedAt'] as String),
    );

Map<String, dynamic> _$AchievementBadgeToJson(_AchievementBadge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'badgeName': instance.badgeName,
      'category': instance.category,
      'achievedPercent': instance.achievedPercent,
      'achievedAt': instance.achievedAt.toIso8601String(),
    };
