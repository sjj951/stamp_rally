// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stamp _$StampFromJson(Map<String, dynamic> json) => _Stamp(
  id: (json['id'] as num?)?.toInt(),
  spotId: (json['spot_id'] as num).toInt(),
  spotName: json['spot_name'] as String,
  category: json['category'] as String? ?? '',
  prefecture: json['prefecture'] as String? ?? '',
  url: json['url'] as String? ?? '',
  comment: json['comment'] as String? ?? '',
  imagePath: json['image_path'] as String?,
  favorite: (json['favorite'] as num?)?.toInt() ?? 0,
  scanDate: json['scan_date'] as String,
);

Map<String, dynamic> _$StampToJson(_Stamp instance) => <String, dynamic>{
  'id': instance.id,
  'spot_id': instance.spotId,
  'spot_name': instance.spotName,
  'category': instance.category,
  'prefecture': instance.prefecture,
  'url': instance.url,
  'comment': instance.comment,
  'image_path': instance.imagePath,
  'favorite': instance.favorite,
  'scan_date': instance.scanDate,
};
