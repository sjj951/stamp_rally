import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/sqlite_bool_converter.dart';
import '../converters/sqlite_datetime_converter.dart';
part 'stamp.freezed.dart';
part 'stamp.g.dart';

@freezed
abstract class Stamp with _$Stamp {
  const factory Stamp({
    int? id,

    @JsonKey(name: 'spot_id') required int spotId,

    @JsonKey(name: 'spot_name') required String spotName,

    @Default('') String category,

    @Default('') String prefecture,

    @Default('') String url,

    @Default('') String comment,

    @JsonKey(name: 'image_path') String? imagePath,
    @SqliteBoolConverter() @Default(false) bool favorite,

    @JsonKey(name: 'scan_date')
    @SqliteDateTimeConverter()
    required DateTime scanDate,
  }) = _Stamp;

  factory Stamp.fromJson(Map<String, dynamic> json) => _$StampFromJson(json);
  factory Stamp.fromMap(Map<String, dynamic> map) => Stamp.fromJson(map);
}
