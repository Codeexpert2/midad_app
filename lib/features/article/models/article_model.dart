class Article {
  Article({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    this.author,
    this.date,
  });
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String? author;
  final DateTime? date;
}
