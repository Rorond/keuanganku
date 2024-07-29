class Income {
  int? id;
  String? name;
  String? category;
  String? date;
  double? jumlah;
  String? imageUrl;
  String? description;

  Income({
    this.id,
    this.name,
    this.category,
    this.date,
    this.jumlah,
    this.imageUrl,
    this.description,
  });

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        date: json['date'] as String?,
        jumlah: json['jumlah'] as double?,
        imageUrl: json['image_url'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'date': date,
        'jumlah': jumlah,
        'image_url': imageUrl,
        'description': description,
      };
}
