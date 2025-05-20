class Slide {
  Slide({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  int id;
  String title;
  String image;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
