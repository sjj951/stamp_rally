// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryProgress _$CategoryProgressFromJson(Map<String, dynamic> json) =>
    _CategoryProgress(
      category: json['category'] as String,
      totalCount: (json['total_count'] as num).toInt(),
      acquiredCount: (json['acquired_count'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryProgressToJson(_CategoryProgress instance) =>
    <String, dynamic>{
      'category': instance.category,
      'total_count': instance.totalCount,
      'acquired_count': instance.acquiredCount,
    };
