import 'package:flutter/foundation.dart';

import '../models/achievement_badge.dart';
import '../models/spot.dart';
import '../repositories/spot_repository.dart';
import '../models/repository_result.dart';

class BadgeDetailViewModel extends ChangeNotifier {
  BadgeDetailViewModel(this.badge);

  final AchievementBadge badge;

  final SpotRepository _repository = SpotRepository();

  bool isLoading = false;

  String? errorMessage;

  List<Spot> completedSpots = [];

  Future<void> load() async {
    isLoading = true;

    notifyListeners();

    try {
      final result = await _repository.getCompletedSpotsByCategory(
        badge.category,
      );

      result.when(
        success: (spots) {
          completedSpots = spots;
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
}
