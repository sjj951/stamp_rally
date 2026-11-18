import 'spot.dart';

extension SpotDbMapper on Spot {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spot_name': spotName,
      'category': category,
      'prefecture': prefecture,
      'url': url,
      'comment': comment,
    };
  }
}
