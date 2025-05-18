class Tag {
  Tag({
    required this.id,
    required this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }

  int id;
  String name;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'pivot': pivot?.toJson(),
    };
  }
}

class Pivot {
  Pivot({
    required this.promptId,
    required this.promptTagId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      promptId: json['prompt_id'],
      promptTagId: json['prompt_tag_id'],
    );
  }

  int promptId;
  int promptTagId;

  Map<String, dynamic> toJson() {
    return {
      'prompt_id': promptId,
      'prompt_tag_id': promptTagId,
    };
  }
}
