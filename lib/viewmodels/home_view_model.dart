import 'package:flutter/foundation.dart';

import '../repositories/stamp_repository.dart';
import '../repositories/spot_repository.dart';
import '../models/category_progress.dart';
import '../models/repository_result.dart';

class HomeViewModel extends ChangeNotifier {
  final StampRepository _stampRepository = StampRepository();

  final SpotRepository _spotRepository = SpotRepository();

  int stampCount = 0;
  String? errorMessage;
  List<CategoryProgress> categoryProgress = [];

  Future<void> load() async {
    final resultCount = await _stampRepository.getCount();
    resultCount.when(
      success: (count) {
        stampCount = count;
      },

      failure: (message) {
        errorMessage = message;
      },
    );

    final resultCategoryProgress = await _spotRepository.getCategoryProgress();
    resultCategoryProgress.when(
      success: (progress) {
        categoryProgress = progress;
      },
      failure: (message) {
        errorMessage = message;
      },
    );

    notifyListeners();
  }
}
