class Area {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  Area({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
