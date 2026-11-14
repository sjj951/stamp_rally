class Stamp {
  final int? id;
  final int spotId;

  final String spotName;
  final String category;
  final String url;
  final String comment;

  final String? imagePath;

  final int favorite;

  final String scanDate;

  const Stamp({
    this.id,
    required this.spotId,
    required this.spotName,
    required this.category,
    required this.url,
    required this.comment,
    required this.scanDate,
    this.imagePath,
    this.favorite = 0,
  });

  factory Stamp.fromMap(Map<String, dynamic> map) {
    return Stamp(
      id: map['id'],
      spotId: map['spot_id'],
      spotName: map['spot_name'],
      category: map['category'] ?? '',
      url: map['url'] ?? '',
      comment: map['comment'] ?? '',
      imagePath: map['image_path'],
      favorite: map['favorite'] ?? 0,
      scanDate: map['scan_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spot_id': spotId,
      'spot_name': spotName,
      'category': category,
      'url': url,
      'comment': comment,
      'image_path': imagePath,
      'favorite': favorite,
      'scan_date': scanDate,
    };
  }

  Stamp copyWith({
    int? id,
    int? spotId,
    String? spotName,
    String? category,
    String? url,
    String? comment,
    String? imagePath,
    int? favorite,
    String? scanDate,
  }) {
    return Stamp(
      id: id ?? this.id,
      spotId: spotId ?? this.spotId,
      spotName: spotName ?? this.spotName,
      category: category ?? this.category,
      url: url ?? this.url,
      comment: comment ?? this.comment,
      imagePath: imagePath ?? this.imagePath,
      favorite: favorite ?? this.favorite,
      scanDate: scanDate ?? this.scanDate,
    );
  }
}
