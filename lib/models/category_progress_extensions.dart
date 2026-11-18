import 'category_progress.dart';

extension CategoryProgressDbMapper on CategoryProgress {
  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'total_count': totalCount,
      'acquired_count': acquiredCount,
    };
  }
}
