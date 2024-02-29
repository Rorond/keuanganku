import 'package:hive/hive.dart';
import 'package:keuanganku/models/category/category.dart';

class CategoryAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 1;

  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
      id: reader.read(),
      name: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..write(obj.id)
      ..write(obj.name);
  }
}
