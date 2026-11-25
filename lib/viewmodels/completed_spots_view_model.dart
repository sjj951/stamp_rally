import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import '../models/repository_result.dart';

class CompletedSpotsViewModel extends ChangeNotifier {
  CompletedSpotsViewModel(this.category);

  final String category;

  final StampRepository _repository = StampRepository();

  List<Stamp> stamps = [];

  bool isLoading = false;

  String? errorMessage;

  Future<void> load() async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final result = await _repository.getCompletedStampsByCategory(category);

      result.when(
        success: (items) {
          stamps  = items;
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
