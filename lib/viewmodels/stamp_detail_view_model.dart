import 'package:flutter/foundation.dart';

import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';

class StampDetailViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();

  final Stamp stamp;

  StampDetailViewModel(this.stamp);

  bool get isFavorite => stamp.favorite == true;

  Future<void> toggleFavorite() async {
    final newValue = stamp.favorite == false;

    await repository.updateFavorite(stamp.id!, newValue);

    notifyListeners();
  }

  Future<void> updateImage(String imagePath) async {
    await repository.updateImage(stamp.id!, imagePath);

    notifyListeners();
  }
}
