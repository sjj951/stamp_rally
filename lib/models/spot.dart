import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';

@freezed
abstract class Spot with _$Spot {
  const factory Spot({
    int? id,

    required int spotId,

    required String spotName,

    @Default('') String category,

    @Default('') String prefecture,

    @Default('') String url,

    @Default('') String comment,
  }) = _Spot;

  factory Spot.fromMap(Map<String, dynamic> map) {
    return Spot(
      id: map['id'],
      spotId: map['spot_id'],
      spotName: map['spot_name'],
      category: map['category'],
      prefecture: map['prefecture'],
      url: map['url'],
      comment: map['comment'],
    );
  }
}
