import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/cash/cash.dart';

class CashService {
  static List<Cash> cash = [];
  static Future<List<Cash>> get() async {
    var data = await mainStorage.get("cash");
    cash = List<Cash>.from(data ?? []);
    return cash;
  }

  static Future<List<Cash>> searchByDateRange(
      DateTime startDate, DateTime endDate, String status) async {
    await get();
    var data = List<Cash>.from(cash).where((cashItem) {
      return cashItem.status == status &&
          cashItem.date != null &&
          cashItem.date!.isAfter(startDate) &&
          (cashItem.date!.isAtSameMomentAs(startDate) ||
              cashItem.date!.isBefore(endDate.add(Duration(days: 1))));
    }).toList();
    return data;
  }

  static Future<void> save(List<Cash> data) async {
    await mainStorage.put("cash", data);
    await get();
  }

  static Future<void> add(Cash data) async {
    List<Cash> cash = await get();
    cash.add(data);
    await save(cash);
  }

  static Future<void> edit(Cash data) async {
    List<Cash> cash = await get();
    int index = cash.indexWhere((element) => element.id == data.id);
    if (index != -1) {
      cash[index] = data;
      await save(cash);
    } else {
      Get.snackbar("Error", "Data not found");
    }
  }

  static Future<void> delete(Cash value) async {
    cash.remove(value);
    await save(cash);
  }
}
