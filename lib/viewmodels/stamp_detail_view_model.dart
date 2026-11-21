import 'package:flutter/foundation.dart';

import '../models/repository_result.dart';
import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';

class StampDetailViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();
  StampDetailViewModel(this.stamp);
  Stamp stamp;
  bool isLoading = false;
  String? errorMessage;
  bool get isFavorite => stamp.favorite == true;
  String? get imagePath => stamp.imagePath;

  Future<bool> toggleFavorite() async {
    if (stamp.id == null) {
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final newFavorite = stamp.favorite == false;

      final result = await repository.updateFavorite(stamp.id!, newFavorite);

      return await result.when(
        success: (_) {
          stamp = stamp.copyWith(favorite: newFavorite ? true : false);

          notifyListeners();

          return true;
        },

        failure: (message) {
          errorMessage = message;

          notifyListeners();

          return false;
        },
      );
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> updateImage(String imagePath) async {
    if (stamp.id == null) {
      return false;
    }

    isLoading = true;
    errorMessage = null;

    notifyListeners();
    try {
      final result = await repository.updateImage(stamp.id!, imagePath);
      return await result.when(
        success: (_) {
          stamp = stamp.copyWith(imagePath: imagePath);

          notifyListeners();

          return true;
        },

        failure: (message) {
          errorMessage = message;

          notifyListeners();

          return false;
        },
      );
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> deleteStamp() async {
    if (stamp.id == null) {
      return false;
    }

    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final result = await repository.delete(stamp.id!);

      return await result.when(
        success: (_) {
          return true;
        },

        failure: (message) {
          errorMessage = message;

          notifyListeners();

          return false;
        },
      );
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  void clearError() {
    errorMessage = null;

    notifyListeners();
  }
}
