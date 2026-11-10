class Stamp {
  int? id;
  String spotName;
  String url;
  String comment;
  String scanDate;

  Stamp({
    this.id,
    required this.spotName,
    required this.url,
    required this.comment,
    required this.scanDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spot_name': spotName,
      'url': url,
      'comment': comment,
      'scan_date': scanDate,
    };
  }
}