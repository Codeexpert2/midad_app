import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));
String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.projects,
  });
  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        projects: json['projects'] == null
            ? []
            : List<Project>.from(
                json['projects']!.map((x) => Project.fromJson(x))),
      );
  List<Project>? projects;
  Map<String, dynamic> toJson() => {
        'projects': projects == null
            ? []
            : List<dynamic>.from(projects!.map((x) => x.toJson())),
      };
}

class Project {
  Project({
    this.id,
    this.title,
    this.image,
    this.desc,
    this.url,
    this.createdAt,
    this.updatedAt,
  });
  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        desc: json['desc'],
        url: json['url'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );
  int? id;
  String? title;
  String? image;
  String? desc;
  String? url;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'desc': desc,
        'url': url,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
