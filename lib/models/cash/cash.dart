class Cash {
  int? id;
  String? name;
  String? date;
  int? jumlah;
  String? imageUrl;
  String? status;

  Cash({
    this.id,
    this.name,
    this.date,
    this.jumlah,
    this.imageUrl,
    this.status,
  });

  factory Cash.fromJson(Map<String, dynamic> json) => Cash(
        id: json['id'] as int?,
        name: json['name'] as String?,
        date: json['date'] as String?,
        jumlah: json['jumlah'] as int?,
        imageUrl: json['image_url'] as String?,
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date,
        'jumlah': jumlah,
        'image_url': imageUrl,
        'status': status,
      };
}
