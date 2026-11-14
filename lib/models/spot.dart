class Spot {
  final int id;
  final String spotName;
  final String category;
  final String? url;
  final String? comment;

  const Spot({
    required this.id,
    required this.spotName,
    required this.category,
    this.url,
    this.comment,
  });

  factory Spot.fromMap(Map<String, dynamic> map) {
    return Spot(
      id: map['id'],
      spotName: map['spot_name'],
      category: map['category'],
      url: map['url'],
      comment: map['comment'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spot_name': spotName,
      'category': category,
      'url': url,
      'comment': comment,
    };
  }
}
