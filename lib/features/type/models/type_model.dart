class TypeModel {
  TypeModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) {
    return TypeModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
  final int id;
  final String name;
  final String status;
}
