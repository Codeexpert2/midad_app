class Category {
  Category({
    required this.id,
    required this.name,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
    );
  }
  int id;
  String name;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
