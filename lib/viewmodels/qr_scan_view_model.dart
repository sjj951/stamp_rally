import 'package:flutter/foundation.dart';

import '../repositories/stamp_repository.dart';
import '../models/repository_result.dart';
import '../models/stamp.dart';
import '../services/badge_service.dart';

class QrScanViewModel extends ChangeNotifier {
  final StampRepository _stampRepository = StampRepository();

  String? errorMessage;

  Future<void> saveStamp(Stamp stamp) async {
    final result = await _stampRepository.insert(stamp);

    await result.when(
      success: (_) async {
        await BadgeService().checkAndUnlockBadges();
      },

      failure: (message) {
        errorMessage = message;
      },
    );
  }

  Future<bool> exists(int spotId) async {
    final result = await _stampRepository.exists(spotId);
    return result.when(success: (value) => value, failure: (_) => false);
  }
}
