import 'package:flutter/foundation.dart';

import '../repositories/stamp_repository.dart';
import '../models/repository_result.dart';
import '../models/stamp.dart';
import '../models/achievement_badge.dart';

class QrScanViewModel extends ChangeNotifier {
  final StampRepository _stampRepository = StampRepository();

  String? errorMessage;
  bool isLoading = false;
  List<AchievementBadge> unlockedBadges = [];

  Future<void> saveStamp(Stamp stamp) async {
    isLoading = true;

    notifyListeners();

    try {
      final result = await _stampRepository.saveStampAndBadges(stamp);

      result.when(
        success: (badges) {
          unlockedBadges = badges;
        },

        failure: (message) {
          errorMessage = message;
        },
      );
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> exists(int spotId) async {
    final result = await _stampRepository.exists(spotId);
    return result.when(success: (value) => value, failure: (_) => false);
  }
}
