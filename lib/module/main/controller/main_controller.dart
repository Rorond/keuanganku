import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/cash/cash.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainController extends GetxController {
  MainView? view;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final TextEditingController labelController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  List<Cash> cash = [];
  final isLoading = RxBool(false);
  final isOpen = RxBool(false);

  @override
  void onInit() {
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
    cash = await mainStorage.get("cash") ?? [];
  }

  save() async {
    await mainStorage.put("cash", cash);
  }

  add(Cash value) async {
    cash.add(value);
    await save();
  }
}
