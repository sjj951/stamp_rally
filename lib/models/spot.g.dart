// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Spot _$SpotFromJson(Map<String, dynamic> json) => _Spot(
  id: (json['id'] as num).toInt(),
  spotName: json['spot_name'] as String,
  category: json['category'] as String? ?? '',
  prefecture: json['prefecture'] as String? ?? '',
  url: json['url'] as String?,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$SpotToJson(_Spot instance) => <String, dynamic>{
  'id': instance.id,
  'spot_name': instance.spotName,
  'category': instance.category,
  'prefecture': instance.prefecture,
  'url': instance.url,
  'comment': instance.comment,
};
