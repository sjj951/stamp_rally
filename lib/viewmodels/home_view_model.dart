import 'package:flutter/foundation.dart';

import '../repositories/stamp_repository.dart';
import '../repositories/spot_repository.dart';
import '../models/category_progress.dart';

class HomeViewModel extends ChangeNotifier {
  final StampRepository _stampRepository = StampRepository();

  final SpotRepository _spotRepository = SpotRepository();

  int stampCount = 0;

  List<CategoryProgress> categoryProgress = [];

  Future<void> load() async {
    stampCount = await _stampRepository.getCount();

    categoryProgress = await _spotRepository.getCategoryProgress();

    notifyListeners();
  }
}
