import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stamp_rally/models/stamp.dart';
part 'search_result.freezed.dart';

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<Stamp> items,

    required int totalCount,
  }) = _SearchResult;
}
