import 'package:freezed_annotation/freezed_annotation.dart';

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

    @Default(0) int favorite,

    @JsonKey(name: 'scan_date') required String scanDate,
  }) = _Stamp;

  factory Stamp.fromJson(Map<String, dynamic> json) => _$StampFromJson(json);
}
