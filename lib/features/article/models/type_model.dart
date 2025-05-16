class TypeModel {
  TypeModel({
    required this.id,
    required this.name,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
  final int id;
  final String name;
}
