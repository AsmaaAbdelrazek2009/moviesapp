class HistoryDM {
  final int id;
  final String title;
  final String posterPath;
  final DateTime watchedAt;

  HistoryDM({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.watchedAt,
  });

  factory HistoryDM.fromJson(Map<String, dynamic> json) {
    return HistoryDM(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      watchedAt: DateTime.parse(json['watched_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'watched_at': watchedAt.toIso8601String(),
    };
  }
}