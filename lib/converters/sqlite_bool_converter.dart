import 'package:json_annotation/json_annotation.dart';

class SqliteBoolConverter implements JsonConverter<bool, int> {
  const SqliteBoolConverter();

  @override
  bool fromJson(int json) {
    return json == 1;
  }

  @override
  int toJson(bool object) {
    return object ? 1 : 0;
  }
}
