import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Cash {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? category;

  @HiveField(3)
  DateTime? date;

  @HiveField(4)
  double? jumlah;

  @HiveField(5)
  String? imageUrl;

  @HiveField(6)
  String? description;

  @HiveField(7)
  String? status;

  Cash({
    this.id,
    this.name,
    this.category,
    this.date,
    this.jumlah,
    this.imageUrl,
    this.description,
    this.status,
  });

  factory Cash.fromJson(Map<String, dynamic> json) => Cash(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        date: DateTime.parse(json['date'] as String),
        jumlah: json['jumlah'] as double?,
        imageUrl: json['image_url'] as String?,
        description: json['description'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'date': date?.toIso8601String(),
        'jumlah': jumlah,
        'image_url': imageUrl,
        'description': description,
        'status': status,
      };
}
