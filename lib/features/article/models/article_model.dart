import '../../category/models/category_model.dart';

import 'tag_model.dart';
import 'type_model.dart';

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
    this.category,
    this.tags,
    this.type,
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
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      tags: json['tags'] != null
          ? (json['tags'] as List).map((e) => Tag.fromJson(e)).toList()
          : null,
      type: json['type'] != null ? TypeModel.fromJson(json['type']) : null,
    );
  }
  final int id;
  final String title;
  final String content;
  final String image;
  final String promptContent;
  final int userId;
  final int promptTypeId;
  final int promptCategoryId;
  final String status;
  final Category? category;
  final List<Tag>? tags;
  final TypeModel? type;
}
