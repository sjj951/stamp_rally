import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';

class StampDetailViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();

  final Stamp stamp;

  StampDetailViewModel(this.stamp);

  bool get isFavorite => stamp.favorite == 1;

  Future<void> toggleFavorite() async {
    final newValue = stamp.favorite == 0;

    await repository.updateFavorite(stamp.id!, newValue);

    notifyListeners();
  }

  Future<void> updateImage(String imagePath) async {
    await repository.updateImage(stamp.id!, imagePath);

    notifyListeners();
  }
}
