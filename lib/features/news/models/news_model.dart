class News {
  News({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.instructor,
    this.date,
    this.time,
    this.location,
  });
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String? instructor;
  final String? date;
  final String? time;
  final String? location;
}
