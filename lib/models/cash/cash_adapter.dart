import 'package:hive/hive.dart';
import 'package:keuanganku/models/cash/cash.dart';

class CashAdapter extends TypeAdapter<Cash> {
  @override
  final int typeId = 0;

  @override
  Cash read(BinaryReader reader) {
    return Cash(
      id: reader.read(),
      name: reader.read(),
      category: reader.read(),
      date: reader.read(),
      jumlah: reader.read(),
      imageUrl: reader.read(),
      description: reader.read(),
      status: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Cash obj) {
    writer
      ..write(obj.id)
      ..write(obj.name)
      ..write(obj.category)
      ..write(obj.date)
      ..write(obj.jumlah)
      ..write(obj.imageUrl)
      ..write(obj.description)
      ..write(obj.status);
  }
}
