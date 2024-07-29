import 'package:intl/intl.dart';
import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/bar/bar.dart';
import 'package:keuanganku/models/cash/cash.dart';
import 'package:keuanganku/models/category/category.dart';
import 'package:keuanganku/models/pie/pie.dart';
import 'package:keuanganku/module/main/widget/bar.dart';
import 'package:keuanganku/module/main/widget/list_items.dart';
import 'package:keuanganku/module/main/widget/pie.dart';
import 'package:keuanganku/services/category.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:keuanganku/services/cash.dart';

class MainController extends GetxController {
  MainView? view;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  late TabController tabController;
  final TextEditingController labelController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryFormController = TextEditingController();
  final cash = RxList<Cash>();
  final categories = RxList<CategoryModel>([]);
  final isLoading = RxBool(false);
  final isOpen = RxBool(false);
  final totalOutCome = RxDouble(0);
  final totalIncome = RxDouble(0);
  final pieData = RxList<PieData>([]);
  final tabs = RxList<Tab>([]);
  final pageViews = RxList<Widget>([]);

  final carouselList = RxList<Widget>([
    const BarCart(),
    const PieChart(),
  ]);
  final barData = RxList<BarData>([]);
  @override
  void onInit() async {
    await load();
    await loadCategory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setIsOpen() {
    isOpen.value = !isOpen.value;
    update();
  }

  load() async {
    cash.value = await CashService.get();
    if (cash.length > 0) {
      await setBarChart();
      await setPieChart();
      await setTab();
    }
    // update();
  }

  clearInput() {
    labelController.clear();
    jumlahController.clear();
    categoryController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  setTab() {
    List<String> month = [];
    tabs.value = [];
    pageViews.value = [];
    cash.sort((b, a) => a.date!.compareTo(b.date!));
    for (var i = 0; i < cash.length; i++) {
      if (!month.contains(DateFormat('MMMM yyyy').format(cash[i].date!))) {
        var filteredCash = cash
            .where((item) =>
                item.date!.month == cash[i].date!.month &&
                item.date!.year == cash[i].date!.year)
            .toList();
        RxList<Cash> items = filteredCash.obs;
        pageViews.add(
          ListItems(
            items: items,
          ),
        );
        month.add(DateFormat('MMMM yyyy').format(cash[i].date!));
        tabs.add(
          Tab(
            text: DateFormat('MMMM yyyy').format(cash[i].date!),
          ),
        );
      }
    }
    update();
  }

  setBarChart() async {
    DateTime date = DateTime.now();
    DateTime startDate = date.subtract(Duration(days: 6));

    var data = await CashService.searchByDateRange(startDate, date, "Out");
    if (data.length > 0) {
      barData.value = [];
      var totalPerDay = Map<String, double>();
      for (var item in data) {
        String dayKey = DateFormat('EEE').format(item.date!);
        if (!totalPerDay.containsKey(dayKey)) {
          totalPerDay[dayKey] = 0;
        }
        totalPerDay[dayKey] = totalPerDay[dayKey]! + (item.jumlah ?? 0);
      }
      barData.value = totalPerDay.entries.map((entry) {
        return BarData(entry.key, entry.value);
      }).toList();
    }
    update();
  }

  setPieChart() {
    pieData.value = [];
    totalOutCome.value = calculateTotal("Out");
    totalIncome.value = calculateTotal("In");
    pieData.add(PieData('Income', totalIncome.value, 'Income', Colors.green));
    pieData
        .add(PieData('Expenses', totalOutCome.value, 'Expenses', Colors.red));
    update();
  }

  double calculateTotal(param) {
    double total = 0.0;

    for (Cash cashItem in cash) {
      if (cashItem.status == param) {
        total += cashItem.jumlah!;
      }
    }

    return total;
  }

  add(Cash value) async {
    await CashService.add(value);
    await load();
  }

  edit(Cash value) async {
    await CashService.edit(value);
    await load();
  }

  delete(Cash value) async {
    await CashService.delete(value);
    await load();
  }

  loadCategory() async {
    categories.value = await CategoryService.get();
    update();
  }

  addCategory(CategoryModel value) async {
    await CategoryService.add(value);
    await loadCategory();
  }

  editCategory(CategoryModel value) async {
    await CategoryService.edit(value);
    loadCategory();
  }

  deleteCategory(CategoryModel value) async {
    await CategoryService.delete(value);
    await loadCategory();
  }

  setButtonAddCategory() {
    if (categories.length == 0) {
      categories.add(CategoryModel(
        id: 1,
        name: "Add New Category",
      ));
    } else {
      int index = categories
          .indexWhere((category) => category.name == "Add New Category");
      if (index != -1 && index != categories.length - 1) {
        CategoryModel item = categories.removeAt(index);
        categories.add(item);
      }
    }
  }
}
