import 'package:get/get.dart';
import 'package:keuanganku/database/db.dart';
import 'package:keuanganku/models/category/category.dart';

class CategoryService {
  static List<CategoryModel> categories = [];
  static Future<List<CategoryModel>> get() async {
    var data = await mainStorage.get("category");
    categories = List<CategoryModel>.from(data ?? []);
    return categories;
  }

  static Future<void> save(List<CategoryModel> data) async {
    await mainStorage.put("category", data);
    await get();
  }

  static Future<void> add(CategoryModel data) async {
    List<CategoryModel> category = await get();
    category.add(data);
    await save(category);
  }

  static Future<void> edit(CategoryModel data) async {
    List<CategoryModel> category = await get();
    int index = category.indexWhere((element) => element.id == data.id);
    if (index != -1) {
      category[index] = data;
      await save(category);
    } else {
      Get.snackbar("Error", "Data not found");
    }
  }

  static Future<void> delete(CategoryModel value) async {
    categories.remove(value);
    await save(categories);
  }

  static Future<void> clearInput() async {
    categories = [];
    await save(categories);
  }
}
