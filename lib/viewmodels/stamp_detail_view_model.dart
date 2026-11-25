import 'package:flutter/foundation.dart';

import '../models/repository_result.dart';
import '../models/stamp.dart';
import '../repositories/stamp_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class StampDetailViewModel extends ChangeNotifier {
  final StampRepository repository = StampRepository();
  StampDetailViewModel(this.stamp);
  Stamp stamp;
  bool isLoading = false;
  String? errorMessage;
  bool get isFavorite => stamp.favorite == true;
  String? get imagePath => stamp.imagePath;
  final ImagePicker _picker = ImagePicker();
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

  //写真選択処理追加
  Future<bool> pickImageFromGallery() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (picked == null) {
      return false;
    }

    return updateImage(picked.path);
  }

  //カメラ撮影
  Future<bool> takePhoto() async {
    final picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
    );

    if (picked == null) {
      return false;
    }

    return updateImage(picked.path);
  }
  //URLを開く関数追加
  Future<void> openUrl(String url) async {
    debugPrint('URL: $url');

    final uri = Uri.parse(url);

    final result = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint('launch result: $result');
  }

  //Googleマップを開く関数追加
  Future<void> openMap(String placeName) async {
    final uri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(placeName)}',
    );

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
