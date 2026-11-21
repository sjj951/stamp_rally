import 'package:flutter/foundation.dart';

import '../models/achievement_badge.dart';
import '../repositories/badge_repository.dart';
import '../models/repository_result.dart';

class BadgeHistoryViewModel extends ChangeNotifier {
  final BadgeRepository _repository = BadgeRepository();

  List<AchievementBadge> badges = [];

  bool isLoading = false;

  String? errorMessage;

  Future<void> load() async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final result = await _repository.getBadges();

      result.when(
        success: (items) {
          badges = items;
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

  Future<void> refresh() async {
    await load();
  }

  int get badgeCount => badges.length;

  int countByBadgeName(String badgeName) {
    return badges.where((e) => e.badgeName == badgeName).length;
  }

  bool hasBadge(String badgeName, String category) {
    return badges.any(
      (e) => e.badgeName == badgeName && e.category == category,
    );
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
