import '../../category/models/category_model.dart';
import '../../journal/models/journal_model.dart';
import '../../tag/models/tag_model.dart';
import '../../type/models/type_model.dart';

class Article {
  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.promptContent,
    required this.userId,
    required this.promptTypeId,
    required this.promptCategoryId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.tags,
    this.type,
    this.user,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      promptContent: json['prompt_content'],
      userId: json['user_id'],
      promptTypeId: json['prompt_type_id'],
      promptCategoryId: json['prompt_category_id'],
      status: json['status'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at']),
      category:
          json['category'] == null ? null : Category.fromJson(json['category']),
      tags: json['tags'] == null
          ? null
          : (json['tags'] as List).map((e) => Tag.fromJson(e)).toList(),
      type: json['type'] == null ? null : TypeModel.fromJson(json['type']),
      user: json['user'] == null ? null : User.fromJson(json['user']),
    );
  }

  int id;
  String title;
  String content;
  String image;
  String promptContent;
  int userId;
  int promptTypeId;
  int promptCategoryId;
  String status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;
  List<Tag>? tags;
  TypeModel? type;
  User? user;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'image': image,
      'prompt_content': promptContent,
      'user_id': userId,
      'prompt_type_id': promptTypeId,
      'prompt_category_id': promptCategoryId,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'category': category?.toJson(),
      'tags': tags?.map((tag) => tag.toJson()).toList(),
      'type': type?.toJson(),
      'user': user?.toJson(),
    };
  }
}
