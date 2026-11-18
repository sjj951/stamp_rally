import 'package:freezed_annotation/freezed_annotation.dart';

part 'stamp.freezed.dart';

@freezed
abstract class Stamp with _$Stamp {
  const factory Stamp({
    int? id,

    required int spotId,

    required String spotName,

    @Default('') String category,

    @Default('') String prefecture,

    @Default('') String url,

    @Default('') String comment,

    String? imagePath,

    @Default(0) int favorite,

    required String scanDate,
  }) = _Stamp;

  factory Stamp.fromMap(Map<String, dynamic> map) {
    return Stamp(
      id: map['id'] as int?,
      spotId: map['spot_id'] as int,
      spotName: map['spot_name'] as String,
      category: map['category']?.toString() ?? '',
      prefecture: map['prefecture']?.toString() ?? '',
      url: map['url']?.toString() ?? '',
      comment: map['comment']?.toString() ?? '',
      imagePath: map['image_path']?.toString(),
      favorite: map['favorite'] as int? ?? 0,
      scanDate: map['scan_date'] as String,
    );
  }
}
