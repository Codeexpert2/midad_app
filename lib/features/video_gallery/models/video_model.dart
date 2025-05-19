class Video {
  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }

  int id;
  String title;
  String description;
  String url;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
