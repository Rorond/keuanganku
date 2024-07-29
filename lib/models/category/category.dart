import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  CategoryModel({this.id, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  String toString() {
    return name ?? '';
  }
}
