import 'stamp.dart';

extension StampDbMapper on Stamp {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spot_id': spotId,
      'spot_name': spotName,
      'category': category,
      'prefecture': prefecture,
      'url': url,
      'comment': comment,
      'image_path': imagePath,
      'favorite': favorite,
      'scan_date': scanDate,
    };
  }
}
