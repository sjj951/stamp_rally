import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot.freezed.dart';
part 'spot.g.dart';

@freezed
abstract class Spot with _$Spot {
  const factory Spot({
    required int id,

    @JsonKey(name: 'spot_name') required String spotName,

    @Default('') String category,

    @Default('') String prefecture,

    String? url,

    String? comment,
  }) = _Spot;

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);
  factory Spot.fromMap(Map<String, dynamic> map) => Spot.fromJson(map);
}
