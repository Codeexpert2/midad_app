class Video {
  Video({
    required this.id,
    required this.url,
    required this.title,
    required this.description,
  });
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      url: json['url'],
      title: json['title'],
      description: json['description'],
    );
  }
  final int id;
  final String url;
  final String title;
  final String description;
}
